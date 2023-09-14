from typing import List
from datetime import datetime


class FellowDeveloper:
    def __init__(self, user: str, location: str, currently_learning: str, fun_fact: str, hobbies: List[str]):
        self.user = user
        self.location = location
        self.currently_learning = currently_learning
        self.fun_fact = fun_fact
        self.hobbies = ", ".join(hobbies)

    def get_ambitions(self) -> str:
        return f"""
        🚀 {datetime.now().year} Goals 🚀
        💻 Improve my frontend skills
        🐹 Learn Golang
        📝 Contribute to open source projects
        """

    def get_introduction(self) -> str:
        return f"""
        👋 Hi there, I'm {self.user}!
        📍 Location: {self.location}
        😅 Fun fact: {self.fun_fact}
        🦄 Hobbies: {self.hobbies}
        """

    def introduce_me(self) -> None:
        introduction_text = self.get_introduction() + self.get_ambitions()
        print(introduction_text)


if __name__ == "__main__":
    yellow = FellowDeveloper(
        user="Yellow",
        location="Spain",
        currently_learning="Javascript",
        fun_fact="I run a Youtube channel about programming! 📺",
        hobbies=['🎵 Urban Music', '🎮 Gaming', '🎥 Sci-Fi Movies']
    )
    yellow.introduce_me()
