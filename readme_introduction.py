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
        💻 Mejorar mis habilidades como frontend
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
