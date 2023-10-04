<p align="center">
    <a href="http://padawanpath.dev" target="_blank" rel="noopener noreferrer">
        <img align="center" width="200" src="img/logo_no_bg.svg"/>
    </a>
</p>

<p align="center" style="font-size: 1.17em; font-weight: bold;">👋 ¡Hey! Soy Yellow, y me dedico a <strong>programar y a crear contenido</strong> en <a href="http://padawanpath.dev">Padawan Path</a> 👋</p>

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

    def get_introduction(self) -> str:
        return f"""
        ----------------------------------
        💫 Introducción 💫
        ----------------------------------
        👋 Nombre: {self.user}
        📍 País: {self.location}
        👀 Dato curioso: {self.fun_fact}
        🦄 Hobbies: {self.hobbies}
        """

    def get_goals(self) -> str:
        return f"""
        ----------------------------------
        🚀 Metas para el {datetime.now().year} 🚀
        ----------------------------------
        💻 Crear contenido divulgativo
        🐹 Aprender Golang
        📝 Contribuir a proyectos open source
        """

    def introduce_me(self) -> None:
        introduction_text = self.get_introduction() + self.get_goals()
        print(introduction_text)


if __name__ == "__main__":
    yellow = FellowDeveloper(
        user="Yellow 💫",
        location="España 🌍",
        fun_fact="Creo contenido en Padawan Path 📼",
        hobbies=['🎵 Música urbana', '🎮 Gaming', '👾 Ciencia ficción']
    )
    yellow.introduce_me()
 ```

## Main skills

[![Main Skills](https://skillicons.dev/icons?i=python,django,postgres,docker,bash,aws,github,git&theme=dark)](https://skillicons.dev)

## ¡Conecta conmigo!

<p>
    <a href="http://www.padawanpath.dev"><img alt="Website" title="Padawan Path" src="https://img.shields.io/badge/Website-FF0000?style=for-the-badge&logo=google-chrome&logoColor=white"></a>
    <a href="mailto:yellow@padawanpath.dev"><img alt="Gmail" title="Yellow's Gmail" src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white" style="padding-left: 1%"></a>
    <a href="https://twitter.com/yellow_cmd"><img alt="Twitter" title="Yellow's Twitter" src="https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white" style="padding-left: 1%"></a>
</p>
