<p align="center" width="400"><img align="center" width="300" src="img/logo_no_bg.svg"/></p>
    <h3 align="center">💫 ¡Hey! Soy Yellow 💫</h3>
</p>

</br>

 ```python
from typing import List
from datetime import datetime


class FellowDeveloper:
    def __init__(self, user: str, location: str, fun_fact: str, hobbies: List[str]):
        self.user = user
        self.location = location
        self.fun_fact = fun_fact
        self.hobbies = ", ".join(hobbies)

    def get_ambitions(self) -> str:
        return f"""
        🚀 {datetime.now().year} Goals 🚀
        💻 Mejorar mis skills de frontend
        🐹 Aprender Golang
        📝 Contribuir a proyectos open source
        """

    def get_introduction(self) -> str:
        return f"""
        👋 Hey! Soy {self.user}!
        📍 País: {self.location}
        👀 Dato curioso: {self.fun_fact}
        🦄 Hobbies: {self.hobbies}
        """

    def introduce_me(self) -> None:
        introduction_text = self.get_introduction() + self.get_ambitions()
        print(introduction_text)


if __name__ == "__main__":
    yellow = FellowDeveloper(
        user="Yellow",
        location="España",
        fun_fact="Creo contenido en Padawan Path 📼",
        hobbies=['🎵 Música urbana', '🎮 Gaming', '👾 Ciencia ficción']
    )
    yellow.introduce_me()
 ```

## Main skills

[![Main Skills](https://skillicons.dev/icons?i=python,django,postgres,docker,bash,aws,github,git&theme=dark)](https://skillicons.dev)

## ¡Conecta conmigo!

<p>
    <a href="https://www.padawanpath.es"><img alt="Website" title="Padawan Path" src="https://img.shields.io/badge/Website-FF0000?style=for-the-badge&logo=google-chrome&logoColor=white"></a>
    <a href="mailto:yellow@padawanpath.es"><img alt="Gmail" title="Yellow's Gmail" src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white" style="padding-left: 1%"></a>
    <a href="https://twitter.com/yellow_cmd"><img alt="Twitter" title="Yellow's Twitter" src="https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white" style="padding-left: 1%"></a>
    <a href="https://www.youtube.com/@padawanpath"><img alt="Youtube" title="Padawan Path" src="https://img.shields.io/badge/YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white" style="padding-left: 1%"></a>
</p>
