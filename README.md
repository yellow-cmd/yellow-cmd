<p align="center">
    <a href="http://padawanpath.dev" target="_blank" rel="noopener noreferrer">
        <img align="center" width="200" src="img/logo_no_bg.svg"/>
    </a>
</p>

</br>

 ```python
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
 ```

---
<p align="center">
    <a href="https://skillicons.dev" target="_blank" rel="noopener noreferrer">
        <img src="https://skillicons.dev/icons?i=python,django,postgres,docker,bash,aws,github,git&theme=dark" alt="Main Skills" />
    </a>
</p>

---
<p align="center">
    <a href="http://www.padawanpath.dev"><img alt="Website" title="Padawan Path" src="https://img.shields.io/badge/Website-FF0000?style=for-the-badge&logo=google-chrome&logoColor=white"></a>
    <a href="mailto:yellow@padawanpath.dev"><img alt="Gmail" title="Yellow's Gmail" src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white" style="padding-left: 1%"></a>
    <a href="https://twitter.com/yellow_cmd"><img alt="Twitter" title="Yellow's Twitter" src="https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white" style="padding-left: 1%"></a>
</p>
