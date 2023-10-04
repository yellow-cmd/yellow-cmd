from datetime import datetime


class FellowDeveloper:
    def __init__(
        self, user: str, location: str, fun_fact: str, hobbies: list[str]
    ):
        self.user = user
        self.location = location
        self.fun_fact = fun_fact
        self.hobbies = ", ".join(hobbies)

    def get_introduction(self) -> str:
        return f"""
       ----------------------------------
       💫 Introduction 💫
       ----------------------------------
       👋 Name: {self.user}
       📍 Country: {self.location}
       👀 Fun fact: {self.fun_fact}
       🦄 Hobbies: {self.hobbies}
       """

    def get_goals(self) -> str:
        return f"""
       ----------------------------------
       🚀 Goals for {datetime.now().year} 🚀
       ----------------------------------
       💻 Create divulgative content
       🐹 Learn Golang
       📝 Contribute to open-source projects
       """

    def introduce_me(self) -> None:
        introduction_text = self.get_introduction() + self.get_goals()
        print(introduction_text)


if __name__ == "__main__":
    yellow = FellowDeveloper(
        user="Yellow 💫",
        location="Spain 🌍",
        fun_fact="I write tech articles at Padawan Path 📼",
        hobbies=["🎵 Urban music", "🎮 Gaming", "👾 Science fiction"],
    )
    yellow.introduce_me()
