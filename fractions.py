from fraction.Fraction import Fraction as frac
from random import choice

frac_map = {}
lowest_common = {}
for i in range(1, 100):
    frac_map[f'{frac(i * 1, i * 2)}'] = 'ChoiceFraction.OneHalf'
    lowest_common[f'{frac(i * 1, i * 2)}'] = '1/2'

    frac_map[f'{frac(i * 1, i * 3)}'] = 'ChoiceFraction.OneThird'
    lowest_common[f'{frac(i * 1, i * 3)}'] = '1/3'

    frac_map[f'{frac(i * 2, i * 3)}'] = 'ChoiceFraction.TwoThirds'
    lowest_common[f'{frac(i * 2, i * 3)}'] = '2/3'

    frac_map[f'{frac(i * 1, i * 4)}'] = 'ChoiceFraction.OneFourth'
    lowest_common[f'{frac(i * 1, i * 4)}'] = '1/4'

    frac_map[f'{frac(i * 3, i * 4)}'] = 'ChoiceFraction.ThreeFourths'
    lowest_common[f'{frac(i * 3, i * 4)}'] = '3/4'

    frac_map[f'{frac(i * 1, i * 5)}'] = 'ChoiceFraction.OneFifth'
    lowest_common[f'{frac(i * 1, i * 5)}'] = '1/5'

    frac_map[f'{frac(i * 2, i * 5)}'] = 'ChoiceFraction.TwoFifths'
    lowest_common[f'{frac(i * 2, i * 5)}'] = '2/5'

    frac_map[f'{frac(i * 3, i * 5)}'] = 'ChoiceFraction.ThreeFifths'
    lowest_common[f'{frac(i * 3, i * 5)}'] = '3/5'

    frac_map[f'{frac(i * 4, i * 5)}'] = 'ChoiceFraction.FourFifths'
    lowest_common[f'{frac(i * 4, i * 5)}'] = '4/5'

ones = ['','one','two','three','four','five','six','seven','eight','nine','ten','eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen']

def was_were(num: int) -> str:
    if num == 1:
        return 'was'
    return 'were'

def pluralize(word: str, count: int) -> str:
    if count == 1:
        return word
    return f'{word}s'

foods = ['pizza', 'cake', 'pie', 'slice', 'bread']

def gen_questions(base: int, interval: int):
    for i in range(1, base//interval):
        div = i * interval
        rem = base - div

        food = choice(foods)
        print('MathFractions(')
        print(f'\tphraseStart: "The {food} was divided into {ones[base]} slices. After the party, there {was_were(rem)} {ones[rem]} {pluralize("slice", rem)} left. We ate",')
        print(f'\tphraseEnd: "of the {food} during the party.",')
        key = f'{frac(div, base)}'
        print('\tanswer: ' + frac_map[key] + ',')
        print(f'\tkor: "({base} ➖ {rem}) ➗ {base} = {lowest_common[key]}"')
        print('),')

        food = choice(foods)
        print('MathFractions(')
        print(f'\tphraseStart: "The {food} was divided into {ones[base]} slices. During the party, we ate {ones[div]} {pluralize("slice", div)}. I believe that",')
        print(f'\tphraseEnd: "of the {food} was left over after the party.",')
        key = f'{frac(rem, base)}'
        print('\tanswer: ' + frac_map[key] + ',')
        print(f'\tkor: "({base} ➖ {div}) ➗ {base} = {lowest_common[key]}"')
        print('),')

gen_questions(3, 1)
gen_questions(5, 1)
gen_questions(10, 2)
gen_questions(4, 1)
gen_questions(4, 2)
gen_questions(6, 3)
gen_questions(6, 2)
gen_questions(16, 4)
gen_questions(8, 2)
