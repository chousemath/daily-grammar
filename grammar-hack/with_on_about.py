import json
import io
from typing import Tuple, Dict
from random import shuffle

class WithOnAbout:
    def __init__(self, phrase: Tuple[str, str], answer: str, kor: str):
        self.title = 'Prepositions (전치사)'
        self.subtitle = 'with / on / about'
        self.category = 'select-withonabout'
        self.options = ['with', 'on', 'about', '', '']
        self.phraseStart = phrase[0]
        self.phraseEnd = phrase[1]
        self.answer = answer
        self.kor = kor

    def gen(self) -> Dict:
        return {
            'title': self.title,
            'subtitle': self.subtitle,
            'category': self.category,
            'phraseStart': self.phraseStart,
            'phraseEnd': self.phraseEnd,
            'options': self.options,
            'answer': self.answer,
            'kor': self.kor,
        }

    def swift(self, last=False):
        opts = f'options: {self.options}'.replace("'", '"')
        print(f"""
            Question(
                title: "{self.title}",
                subtitle: "{self.subtitle}",
                category: "{self.category}",
                phraseStart: "{self.phraseStart}",
                phraseEnd: "{self.phraseEnd}",
                answer: "{self.answer}",
                kor: "{self.kor}",
                {opts}
            ){',' if not last else ''}
        """)


data = [
    {
        'phrase': ('May I fill out the form', 'a pencil?'),
        'answer': 'with',
        'kor': '이 서식을 연필로 작성해도 될까요?',
    },
    {
        'phrase': ("Why don't you cut the paper", 'scissors?'),
        'answer': 'with',
        'kor': '그 종이는 가위로 자르느 게 어때요?',
    },
]

shuffle(data)
result = { 'questions': [] }
limit = len(data) - 1
for i, d in enumerate(data):
    obj = WithOnAbout(**d)
    obj.swift(last = limit == i)
    result['questions'].append(obj.gen())

if __name__ == '__main__':
    with io.open('with_on_about.json', 'w') as output:
        output.write(json.dumps(result, ensure_ascii=False, indent=4))
