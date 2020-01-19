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
    {
        'phrase': ("This font size is too small, but I can read it", 'glasses.'),
        'answer': 'with',
        'kor': '활자체가 너무 작아. 하지만 안경을 쓰면 읽을 수 있겠어.',
    },
    {
        'phrase': ("Who wrote the words", 'the whiteboard?'),
        'answer': 'on',
        'kor': '칠판에 저거 쓴 사람 누구야?',
    },
    {
        'phrase': ("You can draw a picture", 'this paper.'),
        'answer': 'on',
        'kor': '이 종이 위해 그림을 그리렴.',
    },
    {
        'phrase': ("I got the author's autograph", 'this book cover.'),
        'answer': 'on',
        'kor': '그 책 표지에 저자의 사인을 받았어.',
    },
    {
        'phrase': ("We are", 'the same page!'),
        'answer': 'on',
        'kor': '우린 서로 같은 생각이야!',
    },
    {
        'phrase': ("Today's newspaper is all", 'the Olympics'),
        'answer': 'about',
        'kor': '오늘 신문은 올림픽에 관한 모든 것이 실렸어.',
    },
    {
        'phrase': ("What is your thesis", '?'),
        'answer': 'about',
        'kor': '너의 논문은 무엇에 관한 거지?',
    },
    {
        'phrase': ("My presentation is", 'American history.'),
        'answer': 'about',
        'kor': '제 프레젠테이션은 미국 문화에 관한 것입니다.',
    },
]

shuffle(data)
result = {'questions': []}
limit = len(data) - 1
for i, d in enumerate(data):
    obj = WithOnAbout(**d)
    obj.swift(last=limit == i)
    result['questions'].append(obj.gen())

if __name__ == '__main__':
    with io.open('with_on_about.json', 'w') as output:
        output.write(json.dumps(result, ensure_ascii=False, indent=4))
