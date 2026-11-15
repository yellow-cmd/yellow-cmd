#!/usr/bin/env bash
# Cross-project task board on one GitHub Project (v2), driven by gh.
# Config is cached in ~/.config/ylw/board.env by `setup`.
set -euo pipefail

CONFIG="${YLW_BOARD_CONFIG:-$HOME/.config/ylw/board.env}"

usage() {
  cat <<'USAGE'
board.sh setup [number]                       create "All projects" (or adopt project <number>) and cache its ids
board.sh link <owner/repo>                    link a repo to the board
board.sh add <owner/repo> <title> [body] [status]  open an issue, put it on the board (status: Todo | In Progress | Done; default Todo); prints the issue URL
board.sh move <issue-url> <status>            set the status of an issue on the board
board.sh list [query]                         list items, e.g. list "-status:Done" or list "repo:owner/name"
board.sh open                                 open the board in the browser
USAGE
}

load() {
  [[ -f "$CONFIG" ]] || { echo "Board not set up. Run: board.sh setup" >&2; exit 2; }
  # shellcheck source=/dev/null
  source "$CONFIG"
}

status_option() {
  case "$1" in
    Todo|todo) echo "$YLW_STATUS_TODO" ;;
    "In Progress"|"in progress"|doing) echo "$YLW_STATUS_DOING" ;;
    Done|done) echo "$YLW_STATUS_DONE" ;;
    *) echo "Unknown status: $1 (use Todo, In Progress or Done)" >&2; exit 2 ;;
  esac
}

set_status() {
  local url="$1" option item
  option=$(status_option "$2")
  item=$(gh project item-add "$YLW_PROJECT_NUMBER" --owner "$YLW_PROJECT_OWNER" --url "$url" --format json --jq .id)
  gh project item-edit --id "$item" --project-id "$YLW_PROJECT_ID" \
    --field-id "$YLW_STATUS_FIELD_ID" --single-select-option-id "$option" >/dev/null
}

cmd="${1:-}"; shift || true
case "$cmd" in
  setup)
    owner="@me"
    if [[ -n "${1:-}" ]]; then
      number="$1"
    else
      number=$(gh project create --owner "$owner" --title "All projects" --format json --jq .number) || {
        echo "Failed. If the error mentions scopes, run: gh auth refresh -s project" >&2; exit 1; }
    fi
    project_id=$(gh project view "$number" --owner "$owner" --format json --jq .id)
    fields=$(gh project field-list "$number" --owner "$owner" --format json \
      --jq '.fields[] | select(.name=="Status") | (.id, (.options[] | "\(.id)\t\(.name)"))')
    field_id=$(head -1 <<<"$fields")
    option() { awk -F'\t' -v n="$1" '$2==n {print $1}' <<<"$fields"; }
    todo=$(option "Todo"); doing=$(option "In Progress"); done_=$(option "Done")
    [[ -n "$field_id" && -n "$todo" && -n "$doing" && -n "$done_" ]] || {
      echo "Project $number needs a Status field with Todo, In Progress and Done" >&2; exit 1; }
    mkdir -p "$(dirname "$CONFIG")"
    cat > "$CONFIG" <<CFG
YLW_PROJECT_OWNER="$owner"
YLW_PROJECT_NUMBER="$number"
YLW_PROJECT_ID="$project_id"
YLW_STATUS_FIELD_ID="$field_id"
YLW_STATUS_TODO="$todo"
YLW_STATUS_DOING="$doing"
YLW_STATUS_DONE="$done_"
CFG
    echo "Board ready: project $number. Config: $CONFIG"
    ;;
  link)
    load
    gh project link "$YLW_PROJECT_NUMBER" --owner "$YLW_PROJECT_OWNER" --repo "${1:?owner/repo}"
    ;;
  add)
    load
    repo="${1:?owner/repo}" title="${2:?title}" body="${3:-}" status="${4:-Todo}"
    status_option "$status" >/dev/null
    url=$(gh issue create -R "$repo" --title "$title" --body "$body")
    set_status "$url" "$status"
    echo "$url"
    ;;
  move)
    load
    set_status "${1:?issue-url}" "${2:?status}"
    ;;
  list)
    load
    args=(--limit 200 --format json)
    [[ -n "${1:-}" ]] && args+=(--query "$1")
    gh project item-list "$YLW_PROJECT_NUMBER" --owner "$YLW_PROJECT_OWNER" "${args[@]}" \
      --jq '.items[] | [(.status // "-"), ((.repository // "-") | sub("https://github.com/"; "")), .title, (.content.url // "")] | @tsv'
    ;;
  open)
    load
    gh project view "$YLW_PROJECT_NUMBER" --owner "$YLW_PROJECT_OWNER" --web
    ;;
  ""|-h|--help|help) usage ;;
  *) usage >&2; exit 2 ;;
esac
