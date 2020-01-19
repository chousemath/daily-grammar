from typing import Tuple, Dict


class Gerund:
    def __init__(self, base_word: str, phrase: Tuple[str, str], ans: str):
        self.base_word = base_word
        self.phrase = phrase
        self.ans = ans

    def gen(self) -> Dict:
        return {
            'category': 'fillin-gerund',
            'baseWord': self.base_word,
            'phraseStart': self.phrase[0],
            'phraseEnd': self.phrase[1],
            'answer': self.ans,
        }
