<p align="center" width="300"><img align="center" width="200" src="img/logo_no_bg.svg"/></p>
    <h3 align="center">¡Hey 👋! I'm Yellow 💫</h3>
</p>

</br>

 ```python
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
 ```

## Main skills

<p>
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original-wordmark.svg" style="height:60px; width:60px" title="Python"/>
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/django/django-plain.svg" style="height:50px; width:50px; filter: brightness(0) invert(1); padding-bottom:5px;"title="Django"/>
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/postgresql/postgresql-original.svg" style="height:58px; width:58px; padding-bottom: 2px; padding-left: 5px" title="PostgreSQL"/>
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original-wordmark.svg" style="height:66px; width:66px; padding-left: 5px;" title="Docker"/>
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/bash/bash-original.svg" style="height:60px; width:60px; padding-bottom: 5px; padding-left: 5px" title="Bash"/>
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/amazonwebservices/amazonwebservices-original.svg" style="height:60px; width:60px; padding-left: 8px" title="Amazon Web Services"/>
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/github/github-original-wordmark.svg" style="height:60px; width:60px; padding-left: 5px" title="GitHub"/>
    <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-plain-wordmark.svg" style="height:60px; width:60px; padding-left: 5px" title="Git"/>

</p>

## Connect with me

<p>
    <a href="https://www.padawanpath.es"><img alt="Website" title="Padawan Path" src="https://img.shields.io/badge/Website-FF0000?style=for-the-badge&logo=google-chrome&logoColor=white"></a>
    <a href="mailto:yellow@padawanpath.es"><img alt="Gmail" title="Yellow's Gmail" src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white" style="padding-left: 1%"></a>
    <a href="https://twitter.com/yellow_cmd"><img alt="Twitter" title="Yellow's Twitter" src="https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white" style="padding-left: 1%"></a>
    <a href="https://www.youtube.com/@padawanpath"><img alt="Youtube" title="Padawan Path" src="https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white" style="padding-left: 1%"></a>
</p>
