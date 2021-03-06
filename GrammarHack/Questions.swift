//
//  Questions.swift
//  GrammarHack
//
//  Created by Joseph Sungpil Choi on 2020/01/25.
//  Copyright © 2020 Paw Kitchen. All rights reserved.
//

class Quest {
    var title = "";
    var subtitle = "";
    var category = "";
    var answer = "";
    var kor = "";
    var phraseStart = "";
    var phraseEnd = "";
    var options: [String]? = [];
    var noKor: Bool = false
    
    init(
        title: String,
        subtitle: String,
        category: String,
        phraseStart: String,
        phraseEnd: String,
        answer: String,
        kor: String,
        options: [String]?,
        shuffled: Bool
    ) {
        assert(!category.isEmpty, "category variable is empty")
        assert(!answer.isEmpty, "answer variable is empty")
        
        self.title = title;
        self.subtitle = subtitle;
        self.category = category;
        self.phraseStart = phraseStart;
        self.phraseEnd = phraseEnd;
        self.answer = answer;
        self.noKor = kor.isEmpty
        self.kor = self.noKor ? "번역 준비중" : kor;
        if shuffled {
            self.options = options?.shuffled();
        } else if options != nil {
            self.options = options;
        }
    }
    
    func match(answer: String) -> Bool {
        return answer == self.answer;
    }
}

enum ChoiceWithOnAbout: String {
    case With = "with"
    case On = "on"
    case About = "about"
}
class WithOnAbout: Quest {
    init(
        phraseStart: String,
        phraseEnd: String,
        answer: ChoiceWithOnAbout,
        kor: String
    ) {
        super.init(
            title: "전치사", // Prepositions
            subtitle: "with / on / about",
            category: "select-withonabout",
            phraseStart: phraseStart,
            phraseEnd: phraseEnd,
            answer: answer.rawValue,
            kor: kor,
            options: [ChoiceWithOnAbout.With.rawValue, ChoiceWithOnAbout.On.rawValue, ChoiceWithOnAbout.About.rawValue],
            shuffled: true
        )
    }
}

enum ChoiceAtInOn: String {
    case At = "at"
    case In = "in"
    case On = "on"
}
class AtInOn: Quest {
    init(
        phraseStart: String,
        phraseEnd: String,
        answer: ChoiceAtInOn
    ) {
        super.init(
            title: "전치사", // Prepositions
            subtitle: "at / in / on",
            category: "select-atinon",
            phraseStart: phraseStart,
            phraseEnd: phraseEnd,
            answer: answer.rawValue,
            kor: "",
            options: [ChoiceAtInOn.At.rawValue, ChoiceAtInOn.In.rawValue, ChoiceAtInOn.On.rawValue],
            shuffled: true
        )
    }
}

enum ChoiceAdjAdv: String {
    case Adj = "adjective (형용사)"
    case Adv = "adverb (부사)"
    case Both = "both (형용사+부사)"
}
class AdjOrAdvType: Quest {
    init(
        phraseStart: String,
        answer: ChoiceAdjAdv,
        kor: String
    ) {
        super.init(
            title: "형용사/부사", // Adjectives and Adverbs
            subtitle: "\"ly\"로 끝나는 단어",
            category: "select-adjoradvval",
            phraseStart: phraseStart,
            phraseEnd: "",
            answer: answer.rawValue,
            kor: kor,
            options: [ChoiceAdjAdv.Adj.rawValue, ChoiceAdjAdv.Adv.rawValue, ChoiceAdjAdv.Both.rawValue],
            shuffled: true
        )
    }
}

class AdjOrAdv: Quest {
    init(
        phraseStart: String,
        phraseEnd: String,
        answer: String,
        kor: String,
        options: [String]
    ) {
        super.init(
            title: "형용사/부사",
            subtitle: "형용사 또는 부사",
            category: "select-adjoradvtype",
            phraseStart: phraseStart,
            phraseEnd: phraseEnd,
            answer: answer,
            kor: kor,
            options: options,
            shuffled: true
        )
    }
}

class FutureGoingTo: Quest {
    init(
        phraseStart: String,
        phraseEnd: String,
        answer: String,
        kor: String,
        options: [String]
    ) {
        super.init(
            title: "미래시제", // Positive Statements (Future Tense)
            subtitle: "올바른 옵션을 선택하세요",
            category: "select-futuregoingto",
            phraseStart: phraseStart,
            phraseEnd: phraseEnd,
            answer: answer,
            kor: kor,
            options: options,
            shuffled: true
        )
    }
}

class WhoAreCelebrities: Quest {
    init(
        phraseStart: String,
        phraseEnd: String,
        answer: String,
        options: [String]
    ) {
        super.init(
            title: "상황별 구절", // Who are celebrities
            subtitle: "올바른 옵션을 선택하세요",
            category: "select-celebrities",
            phraseStart: phraseStart,
            phraseEnd: phraseEnd,
            answer: answer,
            kor: "",
            options: options,
            shuffled: true
        )
    }
}

class FreeTimeTrends: Quest {
    init(
        phraseStart: String,
        phraseEnd: String,
        answer: String,
        options: [String]
    ) {
        super.init(
            title: "상황별 구절", // Free Time Trends
            subtitle: "올바른 옵션을 선택하세요",
            category: "select-freetimetrends",
            phraseStart: phraseStart,
            phraseEnd: phraseEnd,
            answer: answer,
            kor: "",
            options: options,
            shuffled: true
        )
    }
}

class RandomQ: Quest {
    init(
        phraseStart: String,
        phraseEnd: String,
        answer: String,
        options: [String]
    ) {
        super.init(
            title: "무작위", // Random Question
            subtitle: "올바른 옵션을 선택하세요",
            category: "select-random",
            phraseStart: phraseStart,
            phraseEnd: phraseEnd,
            answer: answer,
            kor: "",
            options: options,
            shuffled: true
        )
    }
}

class PickTheWrong: Quest {
    init(
        phraseStart: String,
        phraseEnd: String,
        answer: String,
        options: [String]
    ) {
        super.init(
            title: "잘못된 단어", // pick the wrong word
            subtitle: "올바른 옵션을 선택하세요",
            category: "select-pickthewrong",
            phraseStart: phraseStart,
            phraseEnd: phraseEnd,
            answer: answer,
            kor: "",
            options: options,
            shuffled: true
        )
    }
}

class ToeicGrammar: Quest {
    init(
        phraseStart: String,
        phraseEnd: String,
        answer: String,
        options: [String]
    ) {
        super.init(
            title: "TOEIC 문법",
            subtitle: "올바른 옵션을 선택하세요",
            category: "select-toeicgrammar",
            phraseStart: phraseStart,
            phraseEnd: phraseEnd,
            answer: answer,
            kor: "",
            options: options,
            shuffled: true
        )
    }
}

enum ChoiceFraction: String {
    case OneHalf = "one-half"
    case OneFifth = "one-fifth"
    case TwoFifths = "two-fifths"
    case ThreeFifths = "three-fifths"
    case FourFifths = "four-fifths"
    case OneFourth = "one-fourth"
    case ThreeFourths = "three-fourths"
    case OneThird = "one-third"
    case TwoThirds = "two-thirds"
}
class MathFractions: Quest {
    init(
        phraseStart: String,
        phraseEnd: String,
        answer: ChoiceFraction,
        kor: String
    ) {
        super.init(
            title: "수학적 어휘: 분수", // Math Fractions
            subtitle: "올바른 옵션을 선택하세요",
            category: "select-mathfractions",
            phraseStart: phraseStart,
            phraseEnd: phraseEnd,
            answer: answer.rawValue,
            kor: kor,
            options: [
                ChoiceFraction.OneHalf.rawValue,
                ChoiceFraction.OneFifth.rawValue,
                ChoiceFraction.TwoFifths.rawValue,
                ChoiceFraction.ThreeFifths.rawValue,
                ChoiceFraction.FourFifths.rawValue,
                ChoiceFraction.OneFourth.rawValue,
                ChoiceFraction.ThreeFourths.rawValue,
                ChoiceFraction.OneThird.rawValue,
                ChoiceFraction.TwoThirds.rawValue,
            ],
            shuffled: false
        )
    }
}

class AdvFreq: Quest {
    init(
        phraseStart: String,
        phraseEnd: String,
        answer: String,
        kor: String,
        options: [String]
    ) {
        super.init(
            title: "빈도부사", // "Adverbs of Frequency",
            subtitle: "올바른 옵션을 선택하세요",
            category: "select-advfreq",
            phraseStart: phraseStart,
            phraseEnd: phraseEnd,
            answer: answer,
            kor: kor,
            options: options,
            shuffled: true
        )
    }
}

class QuestPos: Quest {
    init(
        phraseStart: String,
        phraseEnd: String,
        answer: Int,
        kor: String,
        count: Int
    ) {
        assert(count > 1, "count value is too small")
        let options = (1...count).map { "Position (\($0))" }
        super.init(
            title: "단어 위치", // "Word Position",
            subtitle: "단어의 올바른 위치를 선택하세요",
            category: "select-position",
            phraseStart: phraseStart,
            phraseEnd: phraseEnd,
            answer: "Position (\(answer))",
            kor: kor,
            options: options,
            shuffled: false
        )
    }
}

class Reading: Quest {
    init(answer: String, kor: String) {
        super.init(
            title: "영어 발음 연습",
            subtitle: "아래의 영어 문장을 읽어보십시오",
            category: "reading",
            phraseStart: "",
            phraseEnd: "",
            answer: answer,
            kor: kor,
            options: nil,
            shuffled: false
        )
    }
}

class Twister: Quest {
    init(answer: String) {
        super.init(
            title: "영어 발음 연습",
            subtitle: "아래의 영어 문장을 읽어보십시오",
            category: "reading-tonguetwister",
            phraseStart: "",
            phraseEnd: "",
            answer: answer,
            kor: "",
            options: nil,
            shuffled: false
        )
    }
}

class AdjComp: Quest {
    init(
        phraseStart: String,
        phraseEnd: String,
        answer: String,
        kor: String,
        options: [String]
    ) {
        super.init(
            title: "비교의 형용사", // "Adjective Comparison",
            subtitle: "올바른 옵션을 선택하세요",
            category: "select-adjcomp",
            phraseStart: phraseStart,
            phraseEnd: phraseEnd,
            answer: answer,
            kor: kor,
            options: options,
            shuffled: true
        )
    }
}

var questions: [Quest] = [
    MathFractions(
        phraseStart: "The cake was divided into three slices. After the party, there were two slices left. We ate",
        phraseEnd: "of the cake during the party.",
        answer: ChoiceFraction.OneThird,
        kor: "(3 ➖ 2) ➗ 3 = 1/3"
    ),
    MathFractions(
        phraseStart: "The pizza was divided into three slices. During the party, we ate one slice. I believe that",
        phraseEnd: "of the pizza was left over after the party.",
        answer: ChoiceFraction.TwoThirds,
        kor: "(3 ➖ 1) ➗ 3 = 2/3"
    ),
    MathFractions(
        phraseStart: "The pizza was divided into three slices. After the party, there was one slice left. We ate",
        phraseEnd: "of the pizza during the party.",
        answer: ChoiceFraction.TwoThirds,
        kor: "(3 ➖ 1) ➗ 3 = 2/3"
    ),
    MathFractions(
        phraseStart: "The slice was divided into three slices. During the party, we ate two slices. I believe that",
        phraseEnd: "of the slice was left over after the party.",
        answer: ChoiceFraction.OneThird,
        kor: "(3 ➖ 2) ➗ 3 = 1/3"
    ),
    MathFractions(
        phraseStart: "The pie was divided into five slices. After the party, there were four slices left. We ate",
        phraseEnd: "of the pie during the party.",
        answer: ChoiceFraction.OneFifth,
        kor: "(5 ➖ 4) ➗ 5 = 1/5"
    ),
    MathFractions(
        phraseStart: "The pizza was divided into five slices. During the party, we ate one slice. I believe that",
        phraseEnd: "of the pizza was left over after the party.",
        answer: ChoiceFraction.FourFifths,
        kor: "(5 ➖ 1) ➗ 5 = 4/5"
    ),
    MathFractions(
        phraseStart: "The pie was divided into five slices. After the party, there were three slices left. We ate",
        phraseEnd: "of the pie during the party.",
        answer: ChoiceFraction.TwoFifths,
        kor: "(5 ➖ 3) ➗ 5 = 2/5"
    ),
    MathFractions(
        phraseStart: "The pizza was divided into five slices. During the party, we ate two slices. I believe that",
        phraseEnd: "of the pizza was left over after the party.",
        answer: ChoiceFraction.ThreeFifths,
        kor: "(5 ➖ 2) ➗ 5 = 3/5"
    ),
    MathFractions(
        phraseStart: "The slice was divided into five slices. After the party, there were two slices left. We ate",
        phraseEnd: "of the slice during the party.",
        answer: ChoiceFraction.ThreeFifths,
        kor: "(5 ➖ 2) ➗ 5 = 3/5"
    ),
    MathFractions(
        phraseStart: "The cake was divided into five slices. During the party, we ate three slices. I believe that",
        phraseEnd: "of the cake was left over after the party.",
        answer: ChoiceFraction.TwoFifths,
        kor: "(5 ➖ 3) ➗ 5 = 2/5"
    ),
    MathFractions(
        phraseStart: "The slice was divided into five slices. After the party, there was one slice left. We ate",
        phraseEnd: "of the slice during the party.",
        answer: ChoiceFraction.FourFifths,
        kor: "(5 ➖ 1) ➗ 5 = 4/5"
    ),
    MathFractions(
        phraseStart: "The cake was divided into five slices. During the party, we ate four slices. I believe that",
        phraseEnd: "of the cake was left over after the party.",
        answer: ChoiceFraction.OneFifth,
        kor: "(5 ➖ 4) ➗ 5 = 1/5"
    ),
    MathFractions(
        phraseStart: "The slice was divided into ten slices. After the party, there were eight slices left. We ate",
        phraseEnd: "of the slice during the party.",
        answer: ChoiceFraction.OneFifth,
        kor: "(10 ➖ 8) ➗ 10 = 1/5"
    ),
    MathFractions(
        phraseStart: "The pizza was divided into ten slices. During the party, we ate two slices. I believe that",
        phraseEnd: "of the pizza was left over after the party.",
        answer: ChoiceFraction.FourFifths,
        kor: "(10 ➖ 2) ➗ 10 = 4/5"
    ),
    MathFractions(
        phraseStart: "The slice was divided into ten slices. After the party, there were six slices left. We ate",
        phraseEnd: "of the slice during the party.",
        answer: ChoiceFraction.TwoFifths,
        kor: "(10 ➖ 6) ➗ 10 = 2/5"
    ),
    MathFractions(
        phraseStart: "The cake was divided into ten slices. During the party, we ate four slices. I believe that",
        phraseEnd: "of the cake was left over after the party.",
        answer: ChoiceFraction.ThreeFifths,
        kor: "(10 ➖ 4) ➗ 10 = 3/5"
    ),
    MathFractions(
        phraseStart: "The cake was divided into ten slices. After the party, there were four slices left. We ate",
        phraseEnd: "of the cake during the party.",
        answer: ChoiceFraction.ThreeFifths,
        kor: "(10 ➖ 4) ➗ 10 = 3/5"
    ),
    MathFractions(
        phraseStart: "The pizza was divided into ten slices. During the party, we ate six slices. I believe that",
        phraseEnd: "of the pizza was left over after the party.",
        answer: ChoiceFraction.TwoFifths,
        kor: "(10 ➖ 6) ➗ 10 = 2/5"
    ),
    MathFractions(
        phraseStart: "The cake was divided into ten slices. After the party, there were two slices left. We ate",
        phraseEnd: "of the cake during the party.",
        answer: ChoiceFraction.FourFifths,
        kor: "(10 ➖ 2) ➗ 10 = 4/5"
    ),
    MathFractions(
        phraseStart: "The slice was divided into ten slices. During the party, we ate eight slices. I believe that",
        phraseEnd: "of the slice was left over after the party.",
        answer: ChoiceFraction.OneFifth,
        kor: "(10 ➖ 8) ➗ 10 = 1/5"
    ),
    MathFractions(
        phraseStart: "The slice was divided into four slices. After the party, there were three slices left. We ate",
        phraseEnd: "of the slice during the party.",
        answer: ChoiceFraction.OneFourth,
        kor: "(4 ➖ 3) ➗ 4 = 1/4"
    ),
    MathFractions(
        phraseStart: "The pie was divided into four slices. During the party, we ate one slice. I believe that",
        phraseEnd: "of the pie was left over after the party.",
        answer: ChoiceFraction.ThreeFourths,
        kor: "(4 ➖ 1) ➗ 4 = 3/4"
    ),
    MathFractions(
        phraseStart: "The bread was divided into four slices. After the party, there were two slices left. We ate",
        phraseEnd: "of the bread during the party.",
        answer: ChoiceFraction.OneHalf,
        kor: "(4 ➖ 2) ➗ 4 = 1/2"
    ),
    MathFractions(
        phraseStart: "The slice was divided into four slices. During the party, we ate two slices. I believe that",
        phraseEnd: "of the slice was left over after the party.",
        answer: ChoiceFraction.OneHalf,
        kor: "(4 ➖ 2) ➗ 4 = 1/2"
    ),
    MathFractions(
        phraseStart: "The cake was divided into four slices. After the party, there was one slice left. We ate",
        phraseEnd: "of the cake during the party.",
        answer: ChoiceFraction.ThreeFourths,
        kor: "(4 ➖ 1) ➗ 4 = 3/4"
    ),
    MathFractions(
        phraseStart: "The pie was divided into four slices. During the party, we ate three slices. I believe that",
        phraseEnd: "of the pie was left over after the party.",
        answer: ChoiceFraction.OneFourth,
        kor: "(4 ➖ 3) ➗ 4 = 1/4"
    ),
    MathFractions(
        phraseStart: "The pizza was divided into four slices. After the party, there were two slices left. We ate",
        phraseEnd: "of the pizza during the party.",
        answer: ChoiceFraction.OneHalf,
        kor: "(4 ➖ 2) ➗ 4 = 1/2"
    ),
    MathFractions(
        phraseStart: "The slice was divided into four slices. During the party, we ate two slices. I believe that",
        phraseEnd: "of the slice was left over after the party.",
        answer: ChoiceFraction.OneHalf,
        kor: "(4 ➖ 2) ➗ 4 = 1/2"
    ),
    MathFractions(
        phraseStart: "The bread was divided into six slices. After the party, there were three slices left. We ate",
        phraseEnd: "of the bread during the party.",
        answer: ChoiceFraction.OneHalf,
        kor: "(6 ➖ 3) ➗ 6 = 1/2"
    ),
    MathFractions(
        phraseStart: "The pie was divided into six slices. During the party, we ate three slices. I believe that",
        phraseEnd: "of the pie was left over after the party.",
        answer: ChoiceFraction.OneHalf,
        kor: "(6 ➖ 3) ➗ 6 = 1/2"
    ),
    MathFractions(
        phraseStart: "The pizza was divided into six slices. After the party, there were four slices left. We ate",
        phraseEnd: "of the pizza during the party.",
        answer: ChoiceFraction.OneThird,
        kor: "(6 ➖ 4) ➗ 6 = 1/3"
    ),
    MathFractions(
        phraseStart: "The slice was divided into six slices. During the party, we ate two slices. I believe that",
        phraseEnd: "of the slice was left over after the party.",
        answer: ChoiceFraction.TwoThirds,
        kor: "(6 ➖ 2) ➗ 6 = 2/3"
    ),
    MathFractions(
        phraseStart: "The pizza was divided into six slices. After the party, there were two slices left. We ate",
        phraseEnd: "of the pizza during the party.",
        answer: ChoiceFraction.TwoThirds,
        kor: "(6 ➖ 2) ➗ 6 = 2/3"
    ),
    MathFractions(
        phraseStart: "The pie was divided into six slices. During the party, we ate four slices. I believe that",
        phraseEnd: "of the pie was left over after the party.",
        answer: ChoiceFraction.OneThird,
        kor: "(6 ➖ 4) ➗ 6 = 1/3"
    ),
    MathFractions(
        phraseStart: "The pie was divided into sixteen slices. After the party, there were twelve slices left. We ate",
        phraseEnd: "of the pie during the party.",
        answer: ChoiceFraction.OneFourth,
        kor: "(16 ➖ 12) ➗ 16 = 1/4"
    ),
    MathFractions(
        phraseStart: "The slice was divided into sixteen slices. During the party, we ate four slices. I believe that",
        phraseEnd: "of the slice was left over after the party.",
        answer: ChoiceFraction.ThreeFourths,
        kor: "(16 ➖ 4) ➗ 16 = 3/4"
    ),
    MathFractions(
        phraseStart: "The pizza was divided into sixteen slices. After the party, there were eight slices left. We ate",
        phraseEnd: "of the pizza during the party.",
        answer: ChoiceFraction.OneHalf,
        kor: "(16 ➖ 8) ➗ 16 = 1/2"
    ),
    MathFractions(
        phraseStart: "The pie was divided into sixteen slices. During the party, we ate eight slices. I believe that",
        phraseEnd: "of the pie was left over after the party.",
        answer: ChoiceFraction.OneHalf,
        kor: "(16 ➖ 8) ➗ 16 = 1/2"
    ),
    MathFractions(
        phraseStart: "The cake was divided into sixteen slices. After the party, there were four slices left. We ate",
        phraseEnd: "of the cake during the party.",
        answer: ChoiceFraction.ThreeFourths,
        kor: "(16 ➖ 4) ➗ 16 = 3/4"
    ),
    MathFractions(
        phraseStart: "The cake was divided into sixteen slices. During the party, we ate twelve slices. I believe that",
        phraseEnd: "of the cake was left over after the party.",
        answer: ChoiceFraction.OneFourth,
        kor: "(16 ➖ 12) ➗ 16 = 1/4"
    ),
    MathFractions(
        phraseStart: "The bread was divided into eight slices. After the party, there were six slices left. We ate",
        phraseEnd: "of the bread during the party.",
        answer: ChoiceFraction.OneFourth,
        kor: "(8 ➖ 6) ➗ 8 = 1/4"
    ),
    MathFractions(
        phraseStart: "The pie was divided into eight slices. During the party, we ate two slices. I believe that",
        phraseEnd: "of the pie was left over after the party.",
        answer: ChoiceFraction.ThreeFourths,
        kor: "(8 ➖ 2) ➗ 8 = 3/4"
    ),
    MathFractions(
        phraseStart: "The pizza was divided into eight slices. After the party, there were four slices left. We ate",
        phraseEnd: "of the pizza during the party.",
        answer: ChoiceFraction.OneHalf,
        kor: "(8 ➖ 4) ➗ 8 = 1/2"
    ),
    MathFractions(
        phraseStart: "The cake was divided into eight slices. During the party, we ate four slices. I believe that",
        phraseEnd: "of the cake was left over after the party.",
        answer: ChoiceFraction.OneHalf,
        kor: "(8 ➖ 4) ➗ 8 = 1/2"
    ),
    MathFractions(
        phraseStart: "The bread was divided into eight slices. After the party, there were two slices left. We ate",
        phraseEnd: "of the bread during the party.",
        answer: ChoiceFraction.ThreeFourths,
        kor: "(8 ➖ 2) ➗ 8 = 3/4"
    ),
    MathFractions(
        phraseStart: "The bread was divided into eight slices. During the party, we ate six slices. I believe that",
        phraseEnd: "of the bread was left over after the party.",
        answer: ChoiceFraction.OneFourth,
        kor: "(8 ➖ 6) ➗ 8 = 1/4"
    ),
    
    ToeicGrammar(phraseStart: "When we land, will we have", phraseEnd: "time to catch our connecting flight?", answer: "enough", options: ["much", "few", "too", "enough"]),
    ToeicGrammar(phraseStart: "We left several messages, but we did not receive", phraseEnd: "reply from the client.", answer: "any", options: ["no", "any", "some", "all"]),
    ToeicGrammar(phraseStart: "Tim has worked in Atlanta", phraseEnd: "his company relocated there.", answer: "since", options: ["while", "since", "even", "ever"]),
    ToeicGrammar(phraseStart: "The notebook was hidden", phraseEnd: "all the papers on my desk.", answer: "among", options: ["among", "about", "around", "along"]),
    ToeicGrammar(phraseStart: "If Jack asks for a discount, tell him we", phraseEnd: "knock 20 percent off for a quick sale.", answer: "can", options: ["must", "should", "can", "ought to"]),
    ToeicGrammar(phraseStart: "I do not think I have", phraseEnd: "seen such a comprehensive report.", answer: "ever", options: ["yet", "ever", "still", "never"]),
    ToeicGrammar(phraseStart: "Early results indicate that", phraseEnd: "candidate was successful in the election.", answer: "neither", options: ["each", "both", "either", "neither"]),
    ToeicGrammar(phraseStart: "As there is", phraseEnd: "capable of maintaining this machine, we cannot use it.", answer: "nobody", options: ["nobody", "anybody", "everybody", "somebody"]),
    ToeicGrammar(phraseStart: "The more details that emerge about the sponsorship deal, the", phraseEnd: "I like it.", answer: "xxx", options: ["less", "fewer", "lower", "least"]),
    ToeicGrammar(phraseStart: "Try and be a little more cheerful because if you don't bear", phraseEnd: "soon, you'll make everyone else miserable.", answer: "up", options: ["through", "along", "up", "to"]),
    ToeicGrammar(phraseStart: "We were in a small rowing boat and were terrified that the steamer hadn't seen us as it was bearing", phraseEnd: "on us.", answer: "down", options: ["down", "across", "over", "under"]),
    ToeicGrammar(phraseStart: "I fully understand your comments and bearing those in", phraseEnd: ", I have made the appropriate decision.", answer: "mind", options: ["brain", "mind", "thought", "sense"]),
    ToeicGrammar(phraseStart: "I hope you can be patient for a little longer and bear", phraseEnd: "me while I try and solve the problem.", answer: "with", options: ["by", "on", "at", "with"]),
    ToeicGrammar(phraseStart: "The judge dismissed the new evidence completely because it had no bearing", phraseEnd: "the trial.", answer: "on", options: ["to", "on", "into", "by"]),
    
    
    
    
    ToeicGrammar(
        phraseStart: "When the client",
        phraseEnd: ", ask her to speak to me.",
        answer: "arrives",
        options: ["arrived", "arrive", "arriving", "arrives"]
    ),
    ToeicGrammar(
        phraseStart: "The biggest problem with this system is",
        phraseEnd: "difficulty with the email.",
        answer: "frequent",
        options: ["often", "sometimes", "very", "frequent"]
    ),
    ToeicGrammar(
        phraseStart: "If the flight arrives early, please look",
        phraseEnd: "Bill Johnson around the gate.",
        answer: "for",
        options: ["at", "on", "for", "about"]
    ),
    ToeicGrammar(
        phraseStart: "In case the shipping manager cannot handle the task, customer service",
        phraseEnd: "help.",
        answer: "can",
        options: ["can", "has", "are", "about"]
    ),
    ToeicGrammar(
        phraseStart: "The company picnic",
        phraseEnd: "because rain was predicted for the weekend.",
        answer: "was called off",
        options: ["was called", "had called off", "was calling", "was called off"]
    ),
    ToeicGrammar(
        phraseStart: "Janitors must",
        phraseEnd: "before beginning work in the morning.",
        answer: "sign in",
        options: ["register", "sign up", "sign in", "write up"]
    ),
    ToeicGrammar(
        phraseStart: "The technical manager",
        phraseEnd: "to the convention in Las Vegas for 3 days.",
        answer: "went",
        options: ["left", "went", "going", "goes"]
    ),
    ToeicGrammar(
        phraseStart: "Her appointment with the CEO was changed from 9:00",
        phraseEnd: "7:30.",
        answer: "to",
        options: ["until", "at", "too", "to"]
    ),
    ToeicGrammar(
        phraseStart: "The clerk locked the cabinet",
        phraseEnd: "getting various supplies for his desk.",
        answer: "after",
        options: ["after", "before", "while", "because"]
    ),
    RandomQ(
        phraseStart: "It takes Matt four hours to mow two lawns. He can mow",
        phraseEnd: "lawns in ten hours.",
        answer: "five lawns",
        options: ["one lawn", "two lawns", "three lawns", "four lawns", "five lawns", "six lawns"]
    ),
    RandomQ(
        phraseStart: "Please give me a",
        phraseEnd: "of noodles.",
        answer: "bowl",
        options: ["glass", "bowl", "plate", "piece"]
    ),
    RandomQ(
        phraseStart: "How",
        phraseEnd: "cows are there in the field?",
        answer: "many",
        options: ["often", "much", "long", "many"]
    ),
    RandomQ(
        phraseStart: "There isn't",
        phraseEnd: "milk in the bottle.",
        answer: "any",
        options: ["some", "an", "a few", "any"]
    ),
    RandomQ(
        phraseStart: "I was born",
        phraseEnd: "1993.",
        answer: "in",
        options: ["at", "on", "to", "in"]
    ),
    RandomQ(
        phraseStart: "My birthday is",
        phraseEnd: "January.",
        answer: "in",
        options: ["at", "on", "to", "in"]
    ),
    RandomQ(
        phraseStart: "I",
        phraseEnd: "two sisters and one brother.",
        answer: "have",
        options: ["her", "have", "has", "his"]
    ),
    RandomQ(
        phraseStart: "How",
        phraseEnd: "apples do you want to buy?",
        answer: "many",
        options: ["big", "much", "many", "long"]
    ),
    RandomQ(
        phraseStart: "Last week, I",
        phraseEnd: "go to the party.",
        answer: "did",
        options: ["did", "is", "do", "are"]
    ),
    RandomQ(
        phraseStart: "October is the",
        phraseEnd: "month of the year.",
        answer: "tenth",
        options: ["tentieth", "ten", "tenty", "tenth"]
    ),
    RandomQ(
        phraseStart: "Who",
        phraseEnd: "football after school?",
        answer: "plays",
        options: ["plays", "are", "playing", "playing", "play"]
    ),
    RandomQ(
        phraseStart: "I",
        phraseEnd: "sick yesterday.",
        answer: "was",
        options: ["are", "am", "was", "is"]
    ),
    RandomQ(
        phraseStart: "Is there",
        phraseEnd: "water in the glass?",
        answer: "any",
        options: ["much", "any", "some", "many"]
    ),
    RandomQ(
        phraseStart: "I am going",
        phraseEnd: "in the sea.",
        answer: "to swim",
        options: ["swam", "to swim", "swimming", "to swam"]
    ),
    RandomQ(
        phraseStart: "He",
        phraseEnd: "a very big head.",
        answer: "has",
        options: ["have", "his", "has", "her"]
    ),
    RandomQ(
        phraseStart: "March is the",
        phraseEnd: "month of the year.",
        answer: "third",
        options: ["thirteenth", "third", "three", "thirtieth"]
    ),
    RandomQ(
        phraseStart: "We don't have",
        phraseEnd: "tomatoes left in the fridge.",
        answer: "any",
        options: ["a few", "any", "some", "much"]
    ),
    RandomQ(
        phraseStart: "He",
        phraseEnd: "two brothers and five sisters.",
        answer: "has",
        options: ["have", "him", "has", "his"]
    ),
    RandomQ(
        phraseStart: "There",
        phraseEnd: "many pens on the table.",
        answer: "are",
        options: ["a", "an", "are", "is"]
    ),
    RandomQ(
        phraseStart: "There",
        phraseEnd: "one pen on the table.",
        answer: "is",
        options: ["a", "an", "is", "are"]
    ),
    RandomQ(
        phraseStart: "I",
        phraseEnd: "a headache.",
        answer: "have",
        options: ["her", "has", "it", "have"]
    ),
    RandomQ(
        phraseStart: "Math",
        phraseEnd: "fun yesterday.",
        answer: "was",
        options: ["shall", "were", "is", "was"]
    ),
    RandomQ(
        phraseStart: "Sunday is the",
        phraseEnd: "day of the week.",
        answer: "first",
        options: ["first", "second", "third", "last"]
    ),
    RandomQ(
        phraseStart: "Suda wants to see the doctor because she is",
        phraseEnd: ". Unfortunately, the hospital near her home is closed today.",
        answer: "ill",
        options: ["ill", "tired", "sad", "thirsty"]
    ),
    RandomQ(
        phraseStart: "December is the last",
        phraseEnd: "of the year.",
        answer: "month",
        options: ["day", "week", "month", "time"]
    ),
    RandomQ(
        phraseStart: "My birthday is",
        phraseEnd: "May.",
        answer: "in",
        options: ["at", "in", "on", "the"]
    ),
    RandomQ(
        phraseStart: "Pat and Pim",
        phraseEnd: "playing in the field.",
        answer: "are",
        options: ["and", "is", "do", "are"]
    ),
    RandomQ(
        phraseStart: "My mother is",
        phraseEnd: "the kitchen.",
        answer: "in",
        options: ["on", "at", "in", "under"]
    ),
    RandomQ(
        phraseStart: "She",
        phraseEnd: "work hard every day.",
        answer: "doesn't",
        options: ["doesn't", "don't", "hasn't", "isn't"]
    ),
    RandomQ(
        phraseStart: "The knife is",
        phraseEnd: "his hand.",
        answer: "in",
        options: ["over", "with", "on", "in"]
    ),
    RandomQ(
        phraseStart: "There are ten books",
        phraseEnd: "the shelf.",
        answer: "on",
        options: ["at", "in", "on", "of"]
    ),
    RandomQ(
        phraseStart: "Some students go to school",
        phraseEnd: "bus.",
        answer: "by",
        options: ["at", "by", "in", "on"]
    ),
    RandomQ(
        phraseStart: "Wanna lives",
        phraseEnd: "New York.",
        answer: "in",
        options: ["at", "on", "of", "in"]
    ),
    RandomQ(
        phraseStart: "Anne",
        phraseEnd: "to school every day.",
        answer: "goes",
        options: ["goes", "go", "going", "cry"]
    ),
    RandomQ(
        phraseStart: "The little cats",
        phraseEnd: "on the table now.",
        answer: "are standing",
        options: ["are standing", "have standing", "is standing", "was standing"]
    ),
    RandomQ(
        phraseStart: "My daughter often",
        phraseEnd: "when she watches a sad movie.",
        answer: "cries",
        options: ["cries", "cried", "cry"]
    ),
    RandomQ(
        phraseStart: "Bob",
        phraseEnd: "not have a car.",
        answer: "does",
        options: ["is", "does", "are", "do"]
    ),
    RandomQ(
        phraseStart: "There are",
        phraseEnd: "oranges in the basket.",
        answer: "some",
        options: ["some", "any", "one", "a"]
    ),
    RandomQ(
        phraseStart: "How much pepper",
        phraseEnd: "in the bottle?",
        answer: "is there",
        options: ["there is", "are there", "has there", "is there"]
    ),
    RandomQ(
        phraseStart: "I am",
        phraseEnd: "to the radio now.",
        answer: "listening",
        options: ["listen", "listened", "listening", "listens"]
    ),
    RandomQ(
        phraseStart: "The stars",
        phraseEnd: "every night.",
        answer: "shine",
        options: ["shine", "shines", "shining"]
    ),
    FreeTimeTrends(
        phraseStart: "After sleeping and working, watching TV is by far the most",
        phraseEnd: "leisure activity the world over.",
        answer: "common",
        options: ["joint", "common", "regular", "general"]
    ),
    FreeTimeTrends(
        phraseStart: "The British watch more TV than any other nation in Europe, but they read more too. The",
        phraseEnd: "majority, 85%, read newspapers, and 54% regularly read books.",
        answer: "vast",
        options: ["huge", "massive", "wide", "vast"]
    ),
    FreeTimeTrends(
        phraseStart: "Husbands help in the household more than they did in former",
        phraseEnd: ".",
        answer: "times",
        options: ["times", "ages", "periods", "dates"]
    ),
    FreeTimeTrends(
        phraseStart: "According to the latest",
        phraseEnd: "by supermarkets, the average British family spends just 11 minutes preparing for dinner.",
        answer: "research",
        options: ["inspections", "examinations", "explorations", "research"]
    ),
    FreeTimeTrends(
        phraseStart: "More than half of young people in the UK have a fulltime job",
        phraseEnd: "the age of 19.",
        answer: "by",
        options: ["with", "up to", "by", "under"]
    ),
    FreeTimeTrends(
        phraseStart: "The",
        phraseEnd: "of young Spanish people do not start full-time work until they are 24.",
        answer: "majority",
        options: ["majority", "most", "bulk", "mass"]
    ),
    FreeTimeTrends(
        phraseStart: "The average American fourteen year-old",
        phraseEnd: "only half an hour a day doing homework.",
        answer: "spends",
        options: ["fills", "occupies", "uses", "spends"]
    ),
    FreeTimeTrends(
        phraseStart: "Many young Americans spend their time chatting on their mobile phones and",
        phraseEnd: "out with friends in shopping malls.",
        answer: "hanging",
        options: ["falling", "hanging", "running", "dropping"]
    ),
    FreeTimeTrends(
        phraseStart: "In the UK, pensioners are almost twice as active as teenagers, according to",
        phraseEnd: "research.",
        answer: "recent",
        options: ["recent", "newest", "latest", "last"]
    ),
    FreeTimeTrends(
        phraseStart: "People over 65 spend nearly two hours a day",
        phraseEnd: "physical activities such as walking, cycling or gardening.",
        answer: "doing",
        options: ["exercising", "having", "making", "doing"]
    ),
    FreeTimeTrends(
        phraseStart: "Surprisingly, people who use the Internet",
        phraseEnd: "do more sport than people who never use it.",
        answer: "regularly",
        options: ["evenly", "regularly", "completely", "wholly"]
    ),
    WhoAreCelebrities(
        phraseStart: "A celebrity is a person who is easily",
        phraseEnd: "by people in a certain region or country.",
        answer: "recognised",
        options: ["identified", "accepted", "recognised", "seen"]
    ),
    WhoAreCelebrities(
        phraseStart: "Celebrities usually get a lot of media",
        phraseEnd: "and often are social people.",
        answer: "attention",
        options: ["attention", "care", "notice", "thought"]
    ),
    WhoAreCelebrities(
        phraseStart: "Many people become celebrities because of their",
        phraseEnd: "and often are social people.",
        answer: "attention",
        options: ["attention", "care", "notice", "thought"]
    ),
    FutureGoingTo(
        phraseStart: "I'm going to",
        phraseEnd: "pizza for lunch today.",
        answer: "have",
        kor: "",
        options: ["be", "bring", "come", "fix", "go", "have", "play", "stop", "study", "tell", "use", "visit"]
    ),
    WithOnAbout(
        phraseStart: "May I fill out the form",
        phraseEnd: "a pencil?",
        answer: ChoiceWithOnAbout.With,
        kor: "이 서식을 연필로 작성해도 될까요?"
    ),
    WithOnAbout(
        phraseStart: "My final presentation is",
        phraseEnd: "American history.",
        answer: ChoiceWithOnAbout.About,
        kor: "제 프레젠테이션은 미국 문화에 관한 것입니다."
    ),
    WithOnAbout(
        phraseStart: "You can draw a picture",
        phraseEnd: "this piece of paper.",
        answer: ChoiceWithOnAbout.On,
        kor: "이 종이 위해 그림을 그리렴."
    ),
    WithOnAbout(
        phraseStart: "This font size is too small, but I can read it",
        phraseEnd: "glasses. Please make it bigger!",
        answer: ChoiceWithOnAbout.With,
        kor: "활자체가 너무 작아. 하지만 안경을 쓰면 읽을 수 있겠어."
    ),
    WithOnAbout(
        phraseStart: "Why don't you cut the paper",
        phraseEnd: "scissors instead of using a knife?",
        answer: ChoiceWithOnAbout.With,
        kor: "그 종이는 가위로 자르느 게 어때요?"
    ),
    WithOnAbout(
        phraseStart: "I think that we are definitely",
        phraseEnd: "the same page!",
        answer: ChoiceWithOnAbout.On,
        kor: "우린 서로 같은 생각이야!"
    ),
    WithOnAbout(
        phraseStart: "I finally got my favorite author's autograph",
        phraseEnd: "the cover of my book. I am so excited!",
        answer: ChoiceWithOnAbout.On,
        kor: "그 책 표지에 저자의 사인을 받았어."
    ),
    WithOnAbout(
        phraseStart: "Who wrote this beautiful poem",
        phraseEnd: "the whiteboard?",
        answer: ChoiceWithOnAbout.On,
        kor: "칠판에 저거 쓴 사람 누구야?"
    ),
    WithOnAbout(
        phraseStart: "What is your class report",
        phraseEnd: "? It is so complicated!",
        answer: ChoiceWithOnAbout.About,
        kor: "너의 논문은 무엇에 관한 거지?"
    ),
    WithOnAbout(
        phraseStart: "Today's newspaper is all",
        phraseEnd: "the Winter Olympics.",
        answer: ChoiceWithOnAbout.About,
        kor: "오늘 신문은 올림픽에 관한 모든 것이 실렸어."
    ),
    AdjOrAdv(
        phraseStart: "John can",
        phraseEnd: "read books about chemistry because that was his major in college.",
        answer: "quickly",
        kor: "",
        options: ["quick", "quicker", "quickest", "quickly"]
    ),
    AdjOrAdv(
        phraseStart: "Sue is a",
        phraseEnd: "girl working at Starbucks. I want to get her phone number!",
        answer: "pretty",
        kor: "",
        options: ["pretty", "prettily", "prettiness", "prettyish"]
    ),
    AdjOrAdv(
        phraseStart: "My biology class is",
        phraseEnd: "loud today. I wish everyone would be quiet.",
        answer: "terribly",
        kor: "",
        options: ["terrible", "terribly", "terribleness"]
    ),
    AdjOrAdv(
        phraseStart: "Today was a",
        phraseEnd: "day. I lost my wallet and a large amount of cash.",
        answer: "terrible",
        kor: "",
        options: ["terrible", "terribly", "terribleness"]
    ),
    AdjOrAdv(
        phraseStart: "Jeremy is so strong, he can",
        phraseEnd: "open this can of soup.",
        answer: "easily",
        kor: "",
        options: ["easy", "easily", "easier", "easiest"]
    ),
    AdjOrAdv(
        phraseStart: "Joanna drives slowly because she is a",
        phraseEnd: "and considerate driver.",
        answer: "careful",
        kor: "",
        options: ["careful", "carefully", "carefulness", "carefree"]
    ),
    AdjOrAdv(
        phraseStart: "Whenever it rains, Jim drives very",
        phraseEnd: "because he wants to be safe.",
        answer: "carefully",
        kor: "",
        options: ["careful", "carefully", "carefulness", "carefree"]
    ),
    AdjOrAdv(
        phraseStart: "Be very",
        phraseEnd: "with this glass of milk. It's hot.",
        answer: "careful",
        kor: "",
        options: ["careful", "carefully", "carefulness", "carefree"]
    ),
    AdjOrAdv(
        phraseStart: "The dog across the street barks",
        phraseEnd: "whenever I walk near his home.",
        answer: "loudly",
        kor: "",
        options: ["loud", "loudly"]
    ),
    AdjOrAdv(
        phraseStart: "The bus driver was",
        phraseEnd: "injured in the accident.",
        answer: "seriously",
        kor: "",
        options: ["serious", "seriously", "seriousness"]
    ),
    AdjOrAdv(
        phraseStart: "Kevin is",
        phraseEnd: "clever. He solved the math problem in under 5 minutes.",
        answer: "extremely",
        kor: "",
        options: ["extreme", "extremely", "extremism", "extremist"]
    ),
    AdjOrAdv(
        phraseStart: "This hamburger tastes",
        phraseEnd: ". I will never return to this restaurant.",
        answer: "awful",
        kor: "",
        options: ["awful", "awfully", "awfulness"]
    ),
    AdjOrAdv(
        phraseStart: "Robin looks so",
        phraseEnd: "today. What's the matter with him?",
        answer: "sad",
        kor: "",
        options: ["sad", "sadden", "saddened"]
    ),
    AdjOrAdvType(
        phraseStart: "slowly",
        answer: ChoiceAdjAdv.Adv,
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "carefully",
        answer: ChoiceAdjAdv.Adv,
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "quickly",
        answer: ChoiceAdjAdv.Adv,
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "heavily",
        answer: ChoiceAdjAdv.Adv,
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "badly",
        answer: ChoiceAdjAdv.Adv,
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "suddenly",
        answer: ChoiceAdjAdv.Adv,
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "hungrily",
        answer: ChoiceAdjAdv.Adv,
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "generally",
        answer: ChoiceAdjAdv.Adv,
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "fully",
        answer: ChoiceAdjAdv.Adv,
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "friendly",
        answer: ChoiceAdjAdv.Adj,
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "lonely",
        answer: ChoiceAdjAdv.Adj,
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "ugly",
        answer: ChoiceAdjAdv.Adj,
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "lovely",
        answer: ChoiceAdjAdv.Adj,
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "silly",
        answer: ChoiceAdjAdv.Adj,
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "lively",
        answer: ChoiceAdjAdv.Adj,
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "unlikely",
        answer: ChoiceAdjAdv.Adj,
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "daily",
        answer: ChoiceAdjAdv.Both,
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "weekly",
        answer: ChoiceAdjAdv.Both,
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "yearly",
        answer: ChoiceAdjAdv.Both,
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "monthly",
        answer: ChoiceAdjAdv.Both,
        kor: ""
    ),
    AdjOrAdvType(
        phraseStart: "early",
        answer: ChoiceAdjAdv.Both,
        kor: ""
    ),
    AdvFreq(
        phraseStart: "We",
        phraseEnd: "to school by bus.",
        answer: "always go",
        kor: "",
        options: ["always go", "go always"]
    ),
    AdvFreq(
        phraseStart: "I",
        phraseEnd: "my room on Saturdays.",
        answer: "often clean",
        kor: "",
        options: ["often clean", "clean often"]
    ),
    AdvFreq(
        phraseStart: "They",
        phraseEnd: "tablets in the classroom.",
        answer: "sometimes use",
        kor: "",
        options: ["sometimes use", "use sometimes"]
    ),
    AdvFreq(
        phraseStart: "He",
        phraseEnd: "home before 8 pm.",
        answer: "never gets",
        kor: "",
        options: ["never gets", "gets never"]
    ),
    AdvFreq(
        phraseStart: "The children",
        phraseEnd: "YouTube videos.",
        answer: "often watch",
        kor: "",
        options: ["often watch", "watch often"]
    ),
    AdvFreq(
        phraseStart: "James, my roommate,",
        phraseEnd: "his bed on Saturday mornings. It drives me crazy!",
        answer: "seldom makes",
        kor: "",
        options: ["seldom makes", "makes seldom"]
    ),
    AdvFreq(
        phraseStart: "Do they",
        phraseEnd: "to the supermarket? It's so close to their house!",
        answer: "never walk",
        kor: "",
        options: ["never walk", "walk never"]
    ),
    AdvFreq(
        phraseStart: "We don't",
        phraseEnd: "coffee for breakfast. Sometimes we have juice instead!",
        answer: "always have",
        kor: "",
        options: ["always have", "have always"]
    ),
    AdvFreq(
        phraseStart: "Sally, my neighbor,",
        phraseEnd: "basketball in the afternoon.",
        answer: "always plays",
        kor: "",
        options: ["always plays", "plays always"]
    ),
    AdvFreq(
        phraseStart: "My friend, Mrs. Johnson,",
        phraseEnd: "a shower when she gets home in the evening.",
        answer: "often takes",
        kor: "",
        options: ["often takes", "takes often"]
    ),
    AdvFreq(
        phraseStart: "My wife and I",
        phraseEnd: "fishing at the lake.",
        answer: "sometimes go",
        kor: "",
        options: ["sometimes go", "go sometimes"]
    ),
    AdvFreq(
        phraseStart: "Jeremy and Jinho",
        phraseEnd: "enough time to finish their homework.",
        answer: "never have",
        kor: "",
        options: ["never have", "have never"]
    ),
    AdvFreq(
        phraseStart: "Where do you",
        phraseEnd: "your summer holidays?",
        answer: "usually spend",
        kor: "",
        options: ["usually spend", "spend usually"]
    ),
    AdjComp(
        phraseStart: "This is a nice cat. It's much",
        phraseEnd: "than my friend's cat.",
        answer: "nicer",
        kor: "",
        options: ["nice", "nicest", "nicer", "mean", "meaner", "meanest"]
    ),
    AdjComp(
        phraseStart: "Here is Emily. She's six years old. Her brother is nine, so he is",
        phraseEnd: ".",
        answer: "older than she is.",
        kor: "",
        options: ["older than she is.", "younger than she is."]
    ),
    QuestPos(
        phraseStart: "Our (1) friends must (2) take (3) a test.",
        phraseEnd: "(also)",
        answer: 2,
        kor: "Our friends must also take a test.",
        count: 3
    ),
    QuestPos(
        phraseStart: "I (1) was (2) joking.",
        phraseEnd: "(only)",
        answer: 2,
        kor: "I was only joking.",
        count: 2
    ),
    QuestPos(
        phraseStart: "Did (1) you (2) enjoy (3) the flight?",
        phraseEnd: "(both)",
        answer: 2,
        kor: "Did you both enjoy the flight?",
        count: 3
    ),
    QuestPos(
        phraseStart: "Mary (1) watches (2) TV.",
        phraseEnd: "(hardly ever)",
        answer: 1,
        kor: "Mary hardly ever watches TV.",
        count: 2
    ),
    QuestPos(
        phraseStart: "He drives (1) his (2) car (3).",
        phraseEnd: "(carefully)",
        answer: 3,
        kor: "He drives his car carefully.",
        count: 3
    ),
    QuestPos(
        phraseStart: "The children (1) play (2) football (3).",
        phraseEnd: "(in the garden)",
        answer: 3,
        kor: "The children play football in the garden.",
        count: 3
    ),
    QuestPos(
        phraseStart: "We (1) went to the (2) cinema (3).",
        phraseEnd: "(yesterday)",
        answer: 3,
        kor: "We went to the cinema yesterday.",
        count: 3
    ),
    QuestPos(
        phraseStart: "John (1) fell (2) off (3) the bike.",
        phraseEnd: "(almost)",
        answer: 1,
        kor: "John almost fell off the bike.",
        count: 3
    ),
    QuestPos(
        phraseStart: "Her (1) boyfriend will (2) buy her some (3) flowers.",
        phraseEnd: "(probably)",
        answer: 2,
        kor: "Her boyfriend will probably buy her some flowers.",
        count: 3
    ),
    QuestPos(
        phraseStart: "My uncle is (1) moving (2) to Stockholm soon (3).",
        phraseEnd: "(definitely)",
        answer: 1,
        kor: "My uncle is definitely moving to Stockholm soon.",
        count: 3
    ),
    Reading(
        answer: "I am frequently late, so my teacher doesn’t like me.",
        kor: "저는 지각을 많이 해서, 선생님 눈 밖에 났어요."
    ),
    Reading(answer: "If you are tired, get some sleep.", kor: "피곤하면 눈 좀 붙여요."),
    Reading(answer: "Take me to the hospital.", kor: "병원에 가주세요."),
    Reading(answer: "I need a doctor.", kor: "의사가 필요해요."),
    Reading(answer: "Have a nice day!", kor: "좋은 하루 보내세요!"),
    Reading(answer: "Have a good trip!", kor: "여행 잘하세요!"),
    Reading(answer: "Where is the bathroom?", kor: "화장실은 어디에 있어요?"),
    Reading(answer: "Please repeat that.", kor: "다시 말해 주세요."),
    Reading(answer: "Please speak slowly.", kor: "천천히 말해 주세요."),
    Reading(answer: "Please write it down.", kor: "적어 주세요."),
    Reading(answer: "I understand.", kor: "이해해요."),
    Reading(answer: "I don’t understand.", kor: "이해 못해요."),
    Reading(answer: "I don’t know.", kor: "몰라요."),
    Reading(answer: "Can you speak Korean?", kor: "한국말을 할 수 있어요?"),
    Reading(answer: "I can speak a little Korean.", kor: "한국말을 조금 할 수 있어요."),
    Reading(answer: "I can’t speak Korean.", kor: "한국말을 못해요."),
    Reading(answer: "How much is this?", kor: "이거 얼마예요?"),
    Reading(answer: "I’ll be right back!", kor: "금방 갔다 올거예요!"),
    Reading(answer: "What is this?", kor: "이게 뭐예요?"),
    Reading(answer: "Don’t worry!", kor: "걱정 하지 마세요!"),
    Reading(answer: "No problem!", kor: "문제 없어요!"),
    Reading(answer: "Please give me a menu.", kor: "메뉴판 주세요."),
    Reading(answer: "Do you have vegetarian dishes?", kor: "채식주의자용 식사 있어요?"),
    Reading(answer: "Is this spicy?", kor: "이거 매워요?"),
    Reading(answer: "Please do not make this spicy.", kor: "맵지 않게 요리해 주세요."),
    Reading(answer: "It’s delicious!", kor: "맛있어요!"),
    Reading(answer: "It was a delicious meal!", kor: "잘 먹었습니다!"),
    Reading(answer: "What time do you close?", kor: "몇시에 문 닫아요?"),
    Reading(answer: "Do you take credit cards?", kor: "카드 돼요?"),
    Reading(answer: "I’d like to eat here.", kor: "여기서 먹고 갈게요."),
    Reading(answer: "Please throw away my receipt", kor: "영수증은 버려 주세요."),
    Reading(answer: "Do you have electrical outlets?", kor: "콘센트 있어요?"),
    Reading(answer: "Where are your electrical outlets?", kor: "콘센트 어디에 있어요?"),
    Reading(answer: "Please give me a receipt.", kor: "영수증 주세요."),
    Reading(answer: "Please give me a discount.", kor: "좀 깎아 주세요."),
    Reading(answer: "How much is it?", kor: "얼마예요?"),
    Reading(answer: "Please give me a refund.", kor: "환불해 주세요."),
    Reading(answer: "Please exchange this.",kor: "교환해 주세요."),
    Reading(answer: "Please wrap it for me.", kor: "포장해 주세요."),
    Reading(answer: "Please dry clean this for me.", kor: "드라이 해 주세요."),
    Reading(answer: "Please iron this for me.", kor: "다림질 해 주세요."),
    Reading(answer: "Please make this longer.", kor: "기장을 늘려 주세요."),
    Reading(answer: "Please make this shorter.",kor: "기장을 줄여 주세요."),
    Reading(answer: "Can you remove this stain?",kor: "얼룩 뺄 수 있어요?"),
    Reading(answer: "When can I pick up my clothes?", kor: "옷을 언제 받을 수 있어요?"),
    Reading(answer: "I’m here to pick up my clothes.", kor: "제 옷을 찾으러 왔어요."),
    Reading(answer: "How much is the total?", kor: "모두 얼마예요?"),
    Reading(answer: "I would like to open a new bank account.", kor: "통장을 만들고 싶어요."),
    Reading(answer: "I would like a check card", kor: "체크 카드를 만들고 싶어요."),
    Reading(answer: "I need to reset my password.", kor: "비밀번호를 재발급 하고 싶어요."),
    Reading(answer: "Are there monthly fees?", kor: "수수료 있어요?"),
    Reading(answer: "Do you need internet banking?", kor: "인터넷 뱅킹 필요해요?"),
    Reading(answer: "I need to make a deposit.", kor: "입금 해주세요."),
    Reading(answer: "I need to make a withdrawal.", kor: "출금 해주세요."),
    Reading(answer: "How much is the wire transfer charge?", kor: "송금 수수료는 얼마예요?"),
    Reading(answer: "Can I apply for a credit card?", kor: "신용 카드 신청할 수 있어요?"),
    Reading(answer: "I need to see a doctor.", kor: "진찰을 받고 싶어요."),
    Reading(answer: "I have health insurance.", kor: "건강 보험 있어요."),
    Reading(answer: "I have a sore throat.", kor: "목이 아파요."),
    Reading(answer: "I have indigestion", kor: "소화불량 체했어요."),
    Reading(answer: "My nose is stuffy.", kor: "코가 막혔어요."),
    Reading(answer: "My nose is runny.", kor: "자꾸 콧물이 나요."),
    Reading(answer: "Where can I get this prescription filled?", kor: "어디에서 약을 조제할 수 있어요?"),
    Reading(answer: "I have a prescription to fill.", kor: "처방전을 받아 왔어요."),
    Reading(answer: "I have a cold.", kor: "감기에 걸렸어요."),
    Reading(answer: "I don’t have any allergies.", kor: "알레르기가 없어요."),
    Reading(answer: "I do not have any allergies.", kor: "알레르기가 없어요."),
    Reading(answer: "I’m here to make an appointment.", kor: "예약하려고 왔는데요."),
    Reading(answer: "I am here to make an appointment.", kor: "예약하려고 왔는데요."),
    Reading(answer: "How long do I have to wait?", kor: "얼마나 기다려야해요?"),
    Reading(answer: "I am here for a cleaning.", kor: "스케일링 하러 왔어요."),
    Reading(answer: "I'm here for a dental checkup.", kor: "치과 검진 하러 왔어요."),
    Reading(answer: "I am here for a dental checkup.", kor: "치과 검진 하러 왔어요."),
    Reading(answer: "My upper tooth hurts.", kor: "윗니가 아파요."),
    Reading(answer: "My lower tooth is sensitive.", kor: "아랫니가 시려요."),
    Reading(answer: "My gums hurt.", kor: "잇몸이 아파요."),
    Reading(answer: "I think I have a cavity.", kor: "충치가 생긴 것 같아요."),
    Reading(answer: "I don’t have dental insurance.", kor: "치과 보험 없어요."),
    Reading(answer: "I do not have dental insurance.", kor: "치과 보험 없어요."),
    Reading(answer: "I have dental insurance.", kor: "치과 보험 있어요."),
    Reading(answer: "Please give me a haircut.", kor: "커트 해주세요."),
    Reading(answer: "How much does a haircut cost?", kor: "머리 커트 얼마예요?"),
    Reading(
        answer: "How long will it take?",
        kor: "시간 얼마나 걸려요?"
    ),
    Reading(
        answer: "Please just trim my hair.",
        kor: "좀 다듬어 주세요."
    ),
    Reading(
        answer: "Are there subtitles for this movie?",
        kor: "영화 자막 있어요?"
    ),
    Reading(
        answer: "What is the genre of the movie?",
        kor: "영화는 무슨 장르에요?"
    ),
    Reading(
        answer: "How long is the movie?",
        kor: "영화 상영 시간이 얼마나 돼요?"
    ),
    Reading(
        answer: "Where is the concession stand?",
        kor: "매점은 어디 있어요?"
    ),
    Reading(
        answer: "Do you give discounts to students?",
        kor: "학생 할인 돼요?"
    ),
    Reading(
        answer: "When is the last movie playing?",
        kor: "마지막 영화는 언제예요?"
    ),
    Reading(
        answer: "How much is the least expensive shipping option?",
        kor: "제일 싼 우편 방법 얼마예요?"
    ),
    Reading(
        answer: "Do I need a customs form?",
        kor: "세관 서류 필요해요?"
    ),
    Reading(
        answer: "Where can I buy stamps?",
        kor: "우표는 어디에서 살 수 있어요?"
    ),
    Reading(
        answer: "Do you sell envelopes?",
        kor: "편지 봉투 팔아요?"
    ),
    Reading(
        answer: "How long will it take to be delivered?",
        kor: "배송기간은 얼마나 걸려요?"
    ),
    Reading(
        answer: "What is the zip code for this address?",
        kor: "이 주소의 우편번호가 뭐예요?"
    ),
    Reading(
        answer: "Please give me some bubble wrap.",
        kor: "뽁뽁이 좀 주세요."
    ),
    Reading(answer: "I’m lost.", kor: "길을 잃어버렸어요."),
    Reading(answer: "I am lost.", kor: "길을 잃어버렸어요."),
    Reading(answer: "How far is it from here?", kor: "여기에서 얼마나 걸리는지 아세요?"),
    Reading(answer: "Is it far from here?", kor: "여기에서 멀어요?"),
    Reading(answer: "It’s quite far.", kor: "꽤 멀어요."),
    Reading(answer: "It is quite far.", kor: "꽤 멀어요."),
    Reading(answer: "It’s not far.", kor: "멀지 않아요."),
    Reading(answer: "It is not far.", kor: "멀지 않아요."),
    Reading(answer: "It’s close.", kor: "가까워요."),
    Reading(answer: "It is close.", kor: "가까워요."),
    Reading(answer: "It’s not within walking distance.", kor: "걸어갈 만한 거리가 아니예요."),
    Reading(answer: "I’m sorry, I’m not from around here.", kor: "미안하지만 저는 이 근처 사람이 아니예요."),
    Reading(answer: "Go left.", kor: "왼쪽 가세요."),
    Reading(answer: "Go right.", kor: "오른쪽에 가세요."),
    Reading(answer: "Go straight.", kor: "쭉 가세요."),
    Reading(answer: "Do you have any rooms available?", kor: "빈방 있어요?"),
    Reading(answer: "I would like to make a reservation.", kor: "예약을 하고 싶어요."),
    Reading(answer: "Did you have a reservation?", kor: "예약은 하셨습니까?"),
    Reading(answer: "I have a reservation.", kor: "네, 예약했어요."),
    Reading(answer: "I don’t have a reservation.", kor: "아직 예약을 하지 않았어요."),
    Reading(answer: "Is breakfast included with the room?", kor: "요금에 조식은 포함되어 있어요?"),
    Reading(answer: "How long would you like to stay?", kor: "몇 박을 하실 겁니까?"),
    Reading(answer: "May I see the room first?", kor: "방을 먼저 봐도 돼요?"),
    Reading(answer: "May I have your name?", kor: "성함을 말씀해주세요?"),
    Reading(answer: "I want to check out now.", kor: "지금 체크 아웃하고 싶어요."),
    Reading(answer: "Please stop the bus here.", kor: "여기서 세워 주세요."),
    Reading(answer: "What time is the last bus?", kor: "마지막 버스 언제예요?"),
    Reading(answer: "Where can I charge my bus card?", kor: "버스 카드 어디에 충전할 수 있어요?"),
    Reading(answer: "Where does this bus go?", kor: "이 버스는 어디로 가요?"),
    Reading(answer: "It doesn’t taste good.", kor: "맛없어요."),
    Reading(answer: "It does not taste good.", kor: "맛없어요."),
    Reading(answer: "I’m hungry.", kor: "배고파요."),
    Reading(answer: "I am hungry.", kor: "배고파요."),
    Reading(answer: "I’m thirsty.", kor: "목 말라요."),
    Reading(answer: "I am thirsty.", kor: "목 말라요."),
    Reading(answer: "I’m a vegetarian.", kor: "저는 채식주의자예요."),
    Reading(answer: "I am a vegetarian.", kor: "저는 채식주의자예요."),
    Reading(answer: "I don’t eat meat.", kor: "저는 고기를 못 먹어요."),
    Reading(answer: "I do not eat meat.", kor: "저는 고기를 못 먹어요."),
    Reading(
        answer: "I can eat anything.",
        kor: "다 먹을 수 있어요."
    ),
    Reading(
        answer: "Nice to meet you.",
        kor: "만나서 반가워요."
    ),
    Reading(
        answer: "What is your name?",
        kor: "이름이 뭐예요?"
    ),
    Reading(
        answer: "Where are you from?",
        kor: "어디에서 왔어요?"
    ),
    Reading(
        answer: "How old are you?",
        kor: "몇 살이에요?"
    ),
    Reading(
        answer: "I can’t speak Korean well.",
        kor: "한국말 잘 못해요."
    ),
    Reading(
        answer: "I’m learning Korean these days.",
        kor: "요즘 한국말 배워요."
    ),
    Reading(
        answer: "What is your job?",
        kor: "직업이 뭐예요?"
    ),
    Reading(
        answer: "Where do you live?",
        kor: "어디에 사세요?"
    ),
    Reading(
        answer: "Are you married?",
        kor: "결혼했어요?"
    ),
    Reading(
        answer: "Long time no see.",
        kor: "오랜만이에요."
    ),
    Reading(
        answer: "Have you eaten?",
        kor: "밥 먹었어요?"
    ),
    Reading(
        answer: "How are you?",
        kor: "잘 지내요?"
    ),
    Reading(
        answer: "How have you been?",
        kor: "잘 지냈어요?"
    ),
    Reading(
        answer: "What have you been up to?",
        kor: "어떻게 지냈어요?"
    ),
    Reading(
        answer: "Where shall we go?",
        kor: "어디로 갈까요?"
    ),
    Reading(
        answer: "Get home safely.",
        kor: "집에 잘 들어가요."
    ),
    Reading(
        answer: "Just a moment please.",
        kor: "잠시만 기다려 주세요."
    ),
    Reading(
        answer: "Would you like to leave a message?",
        kor: "메시지를 남기시겠어요?"
    ),
    Reading(answer: "Can I take a message?", kor: "메시지를 받을 수 있어요?"),
    Reading(answer: "Please repeat that for me.", kor: "다시 말해 주세요."),
    Reading(answer: "Please speak up a little for me.", kor: "좀 더 크게 말해 주세요."),
    Reading(answer: "I will call you back.", kor: "제가 다시 걸게요."),
    Reading(answer: "When shall I call?", kor: "언제쯤 통화가 가능할까요?"),
    Reading(answer: "When should I call you?", kor: "언제쯤 통화가 가능할까요?"),
    Reading(answer: "When can I call you?", kor: "언제쯤 통화가 가능할까요?"),
    Reading(answer: "Please charge my mobile phone for me.", kor: "휴대폰 충전해 주세요."),
    Reading(answer: "Do you sell mobile phone cases?", kor: "휴대폰 케이스 팔아요?"),
    Reading(answer: "Do you sell mobile phone chargers?", kor: "휴대폰 충전기 팔아요?"),
    Reading(answer: "Can I buy a data plan for my phone?", kor: "휴대폰 데이터 플랜랜 살 수 있어요?"),
    Reading(answer: "Can you repair my mobile phone?", kor: "휴대폰 고칠 수 있어요?"),
    Reading(answer: "How much will the repair cost?", kor: "고치는 비용 얼마예요?"),
    Reading(answer: "When can I pick up my phone?", kor: "휴대폰 언제 찾으러 올 수 있어요?"),
    Reading(answer: "Oh my goodness!", kor: "아이고!"),
    Reading(answer: "Did a package arrive for me?", kor: "소포 왔어요?"),
    Reading(answer: "I expect a package to arrive tomorrow.", kor: "내일 소포가 올거예요."),
    Reading(answer: "My hot water doesn’t work.", kor: "뜨거운 물이 안 나와요."),
    Reading(answer: "My hot water heater is broken.", kor: "보일러가 고장났어요."),
    Reading(answer: "My sink is clogged.", kor: "제 싱크대가 막혔어요."),
    Reading(answer: "My toilet is clogged.", kor: "제 변기 막혔어요."),
    Reading(answer: "The lights don’t work.", kor: "불이 안 켜져요."),
    Reading(answer: "The lights do not work.", kor: "불이 안 켜져요."),
    Reading(answer: "The air conditioning isn’t cold.", kor: "에어컨이 안 시원해요."),
    Reading(answer: "The air conditioning is not cold.", kor: "에어컨이 안 시원해요."),
    Reading(answer: "The neighbor's dog keeps barking.", kor: "이웃집 강아지가 계속 짖어요."),
    Reading(answer: "I would like to find housing around here.", kor: "이 근처의 집을 구하고 싶어요."),
    Reading(answer: "I would like to find a studio apartment.", kor: "원룸 구하고 싶어요."),
    Reading(answer: "How much is the monthly rent?", kor: "월세 얼마예요?"),
    Reading(answer: "How much is the deposit?", kor: "보증금 얼마예요?"),
    Reading(answer: "How far is it from the subway station?", kor: "지하철역에서 얼마나 걸려요?"),
    Reading(answer: "I don’t really like it.", kor: "별로 안 좋아요."),
    Reading(answer: "I do not really like it.", kor: "별로 안 좋아요."),
    Reading(answer: "I like this house a lot.", kor: "이 집 마음 들어요."),
    Reading(answer: "What is your phone number?", kor: "핸드폰 번호가 뭐예요?"),
    Reading(answer: "Do you have time this weekend?", kor: "주말에 시간 있어요?"),
    Reading(answer: "Shall we go on a date together?", kor: "우리 데이트 할까요?"),
    Reading(answer: "Shall we get dinner together sometime?", kor: "언제 우리 같이 저녁 먹을까요?"),
    Reading(answer: "You are pretty!", kor: "예쁘네요!"),
    Reading(answer: "You are handsome!", kor: "잘 생겼어요!"),
    Reading(answer: "You are charming!", kor: "매력적이네요!"),
    Reading(answer: "When shall we meet again?", kor: "언제 다시 볼까요?"),
    Reading(answer: "I will give you the address.", kor: "주소를 알려 드릴게요."),
    Reading(answer: "This is an emergency.", kor: "아주 급해요."),
    Reading(answer: "Where is the nearest police station?", kor: "제일 가까운 경찰서는 어디예요?"),
    Reading(answer: "Where is the closest hospital?", kor: "가장 가까운 병원은 어디예요?"),
    Reading(answer: "Please call an ambulance.", kor: "구급차를 불러 주세요."),
    Reading(answer: "Please take me to the hospital.", kor: "병원에 데려가 주세요."),
    Reading(answer: "Please help me.", kor: "도와주세요."),
    Reading(answer: "Where can I get help?", kor: "어디에서 도움을 구할 수 있어요?"),
    Reading(answer: "I am a diabetic.", kor: "저는 당뇨가 있어요."),
    Reading(answer: "You can do it!", kor: "잘할 수 있어요!"),
    Reading(answer: "Don’t give up.", kor: "포기 하지마세요."),
    Reading(answer: "Do not give up.", kor: "포기 하지마세요."),
    Reading(answer: "Cross your fingers for me.", kor: "포기 하지마세요."),
    Reading(answer: "Look at this.", kor: "이것 좀 보세요."),
    Reading(answer: "I have never seen anything like this before.", kor: "이런 거 처음 봐요."),
    Reading(answer: "I have to take a test tomorrow.", kor: "내일 시험 봐야 돼요."),
    Reading(answer: "Why do you keep looking at your watch?", kor: "왜 시계를 자꾸 봐요?"),
    Reading(answer: "I'll definitely read this book later.", kor: "이 책 나중에 꼭 볼 거예요."),
    Reading(answer: "I will definitely read this book later.", kor: "이 책 나중에 꼭 볼 거예요."),
    Reading(answer: "I burned my tongue while I was tasting the food.", kor: "맛을 보다가 혀를 데었어요."),
    Reading(answer: "Yesterday, I watched a movie with my friend.", kor: "어제 친구랑 영화를 봤어요."),
    Reading(answer: "The more I see it, the more I like it.", kor: "보면 볼수록 마음에 들어요."),
    
    Reading(answer: "I haven’t become accustomed to the work yet, so it takes me a long time.", kor: "아직 일이 손에 익지 않아서, 시간이 오래 걸려요."),
    Reading(answer: "I have not become accustomed to the work yet, so it takes me a long time.", kor: "아직 일이 손에 익지 않아서, 시간이 오래 걸려요."),
    Reading(answer: "It’s been a long time since I quit doing that.", kor: " 저는 그 일에서 손 씻은 지 오래 됐어요."),
    Reading(answer: "It has been a long time since I quit doing that.", kor: " 저는 그 일에서 손 씻은 지 오래 됐어요."),
    Reading(answer: "The soccer match was a lot of fun, so I felt really thrilled while watching it.", kor: "축구 경기가 너무 재미있어서 정말 손에 땀을 쥐고 봤어요."),
    Reading(answer: "The soccer match was a lot of fun and I was really on the edge of my seat.", kor: "축구 경기가 너무 재미있어서 정말 손에 땀을 쥐고 봤어요."),
    Reading(answer: "I can’t concentrate on work because I am worried.", kor: "걱정돼서 일이 손에 안 잡혀요."),
    Reading(answer: "I cannot concentrate on work because I am worried.", kor: "걱정돼서 일이 손에 안 잡혀요."),
    Reading(answer: "Recently, I haven’t been making any videos.", kor: "요즘 비디오 만드는 것에 손을 놓고 있었어요."),
    Reading(answer: "Recently, I have not been making any videos.", kor: "요즘 비디오 만드는 것에 손을 놓고 있었어요."),
    Reading(answer: "I begged and begged, but he still said no.", kor: "손이 닳도록 빌었는데도, 안 된다고 했어요."),
    Reading(answer: "I will pull out of this project.", kor: "저는 이 일에서 손 뗄게요."),
    Reading(answer: "I will stop being involved in this project.", kor: "저는 이 일에서 손 뗄게요."),
    Reading(answer: "I’ve finished everything!", kor: "다 끝내 버렸어요!"),
    Reading(answer: "I have finished everything!", kor: "다 끝내 버렸어요!"),
    Reading(answer: "I was hesitating, but I’ve finally bought it!", kor: "고민하다가, 사 버렸어요!"),
    Reading(answer: "I was hesitating, but I have finally bought it!", kor: "고민하다가, 사 버렸어요!"),
    Reading(answer: "I lost it", kor: "잃어 버렸어요."),
    Reading(answer: "I dropped it.", kor: "떨어져 버렸어요."),
    Reading(answer: "I lost the cell phone I bought yesterday.", kor: "어제 산 핸드폰을 잃어 버렸어요."),
    Reading(answer: "I’ve forgotten all the bad things.", kor: "안 좋은 일은 다 잊어 버렸어요."),
    Reading(answer: "Get it over with quickly.", kor: "빨리 끝내 버리세요."),
    Reading(answer: "Finish it quickly and be done with it already.", kor: "빨리 끝내 버리세요."),
    Reading(answer: "I’ve already told them everything.", kor: "벌써 다 말해 버렸어요."),
    Reading(answer: "I have already told them everything.", kor: "벌써 다 말해 버렸어요."),
    Reading(answer: "I didn’t like what I wrote yesterday, so I’ve erased it all.", kor: "어제 쓴 글이 마음에 안 들어서 다 지워 버렸어요."),
    Reading(answer: "I did not like what I wrote yesterday, so I have erased it all.", kor: "어제 쓴 글이 마음에 안 들어서 다 지워 버렸어요."),
    Reading(answer: "My computer has stopped.", kor: "컴퓨터가 멈춰 버렸어요."),
    Reading(answer: "Now that we’ve started it, why don’t we just get it all done today?", kor: "시작한 김에 오늘 다 끝내 버리는 거 어때요?"),
    Reading(answer: "Oh, no! The movie has already begun!", kor: "영화가 벌써 시작해 버렸어요."),
    Reading(answer: "I’m feeling terrible today.", kor: "오늘 기분이 너무 안 좋아요."),
    Reading(answer: "I am feeling terrible today.", kor: "오늘 기분이 너무 안 좋아요."),
    Reading(answer: "I’m so upset today.", kor: "오늘 기분이 너무 안 좋아요."),
    Reading(answer: "I am so upset today.", kor: "오늘 기분이 너무 안 좋아요."),
    Reading(answer: "I’m in no mood to do that.", kor: "지금 그럴 기분 아니에요."),
    Reading(answer: "I am in no mood to do that.", kor: "지금 그럴 기분 아니에요."),
    Reading(answer: "I’m not in the mood to talk now.", kor: "지금 이야기할 기분 아니에요."),
    Reading(answer: "I am not in the mood to talk now.", kor: "지금 이야기할 기분 아니에요."),
    Reading(answer: "Please leave me alone.", kor: "말 시키지 마세요."),
    Reading(answer: "Something really upsetting happened.", kor: "진짜 열 받는 일이 있었어요."),
    Reading(answer: "I’m so upset now because of what happened earlier.", kor: "진짜 열 받는 일이 있었어요."),
    Reading(answer: "I am so upset now because of what happened earlier.", kor: "진짜 열 받는 일이 있었어요."),
    Reading(answer: "How can someone be so mean?", kor: "사람이 어떻게 그래요?"),
    Reading(answer: "How can they do that to me?", kor: "사람이 어떻게 그래요?"),
    Reading(answer: "I don’t even know what to say.", kor: "진짜 어이가 없네"),
    Reading(answer: "I do not even know what to say.", kor: "진짜 어이가 없네"),
    Reading(answer: "I’m so upset now but I’m trying not to show it.", kor: "저 지금 너무 화 나는데 참고 있는 거예요."),
    Reading(answer: "I am so upset now but I am trying not to show it.", kor: "저 지금 너무 화 나는데 참고 있는 거예요."),
    Reading(answer: "I’m so upset.", kor: "진짜 속상해요."),
    Reading(answer: "I am so upset.", kor: "진짜 속상해요."),
    Reading(answer: "I’m so sad.", kor: "진짜 속상해요."),
    Reading(answer: "I am so sad.", kor: "진짜 속상해요."),
    Reading(answer: "I’m so disappointed.", kor: "너무 서운해요."),
    Reading(answer: "I am so disappointed.", kor: "너무 서운해요."),
    Reading(answer: "I trusted them this time but I am really disappointed.", kor: "이번에는 믿고 있었는데 완전 실망했어요."),
    Reading(answer: "I fell asleep.", kor: "잠들었어요."),
    Reading(answer: "I was studying but then I fell asleep.", kor: "공부를 하다가 잠들고 말았어요."),
    Reading(answer: "I caught a cold.", kor: "감기에 걸렸어요."),
    Reading(answer: "I ended up catching a cold.", kor: "감기에 걸리고 말았어요."),
    Reading(answer: "I ended up using all my energy and became exhausted.", kor: "결국 힘이 다 빠지고 말았어요."),
    Reading(answer: "This place has also turned into a desert.", kor: "이곳도 사막이 되고 말았어요."),
    Reading(answer: "I went after the criminal, but I lost him.", kor: "범인을 쫓아갔지만 놓치고 말았어요."),
    Reading(answer: "I ended up promising to go.", kor: "가겠다는 약속을 하고 말았어요."),
    Reading(answer: "I’m worried.", kor: "걱정 돼요."),
    Reading(answer: "I am worried.", kor: "걱정 돼요."),
    Reading(answer: "It worries me.", kor: "걱정 돼요."),
    Reading(answer: "I am anxious.", kor: "불안해요."),
    Reading(answer: "I feel anxious.", kor: "불안해요."),
    Reading(answer: "I’m worried to death.", kor: "걱정돼 죽겠어요."),
    Reading(answer: "I am worried to death.", kor: "걱정돼 죽겠어요."),
    Reading(answer: "I’m so worried.", kor: "걱정돼 죽겠어요."),
    Reading(answer: "I am so worried.", kor: "걱정돼 죽겠어요."),
    Reading(answer: "I’m so anxious that it’s driving me crazy.", kor: "불안해 미치겠어요."),
    Reading(answer: "I am so anxious that it is driving me crazy.", kor: "불안해 미치겠어요."),
    Reading(answer: "What should we do?", kor: "어떻게 하면 좋죠?"),
    Reading(answer: "I don’t feel at ease.", kor: "마음이 안 놓여요."),
    Reading(answer: "I do not feel at ease.", kor: "마음이 안 놓여요."),
    Reading(answer: "I can’t stop worrying.", kor: "마음이 안 놓여요."),
    Reading(answer: "I cannot stop worrying.", kor: "마음이 안 놓여요."),
    Reading(answer: "I hope the problem is solved.", kor: "잘 해결됐으면 좋겠어요."),
    Reading(answer: "I hope the problem gets solved.", kor: "잘 해결됐으면 좋겠어요."),
    Reading(answer: "That’s not good.", kor: "큰일이네요."),
    Reading(answer: "That is not good.", kor: "큰일이네요."),
    Reading(answer: "That’s a big problem.", kor: "큰일이네요."),
    Reading(answer: "That is a big problem.", kor: "큰일이네요."),
    Reading(answer: "How can you not worry in this situation?", kor: "이 상황에서 어떻게 걱정이 안 돼요?"),
    Reading(answer: "I think he’s really well-connected.", kor: "그 사람은 발이 진짜 넓은 것 같아요."),
    Reading(answer: "I think he is really well-connected.", kor: "그 사람은 발이 진짜 넓은 것 같아요."),
    Reading(answer: "There is no one that he doesn’t know.", kor: "모르는 사람이 없어요."),
    Reading(answer: "There is no one that he does not know.", kor: "모르는 사람이 없어요."),
    Reading(answer: "A lot of people went out of their way to help us.", kor: "많은 사람들이 우리를 돕기 위해서 발 벗고 나서 줬어요."),
    Reading(answer: "I ran to get on the train before the door closed, but I fell a step behind.", kor: "지하철 문이 닫히기 전에 타려고 뛰었는데 한 발 늦었어요."),
    Reading(answer: "This is nothing compared to what happened last time.", kor: "이번 일에 비하면 지난 번 일은 정말 새 발의 피예요."),
    
    
    Reading(answer: "I have a favor to ask.", kor: "부탁이 하나 있어요."),
    Reading(answer: "Let me ask you a favor.", kor: "부탁 하나만 할게요."),
    Reading(answer: "Can you do me a favor?", kor: "제 부탁 하나만 들어 줄 수 있어요?"),
    Reading(answer: "I know it won’t be easy, but could I possibly go with you?", kor: "어려운 부탁인 건 알지만, 저도 같이 가면 안 될까요?"),
    Reading(answer: "I’m sorry, but could I borrow your phone?", kor: "죄송한데요, 혹시 전화기 좀 빌릴 수 있을까요?"),
    Reading(answer: "Can you help me for just a second?", kor: "저 잠깐만 도와주실 수 있나요?"),
    Reading(answer: "Please, I beg of you, don’t be late today.", kor: "제발 부탁이니까 오늘은 늦지 마세요."),
    Reading(answer: "Could you get me some milk on your way back?", kor: "돌아오는 길에 우유 좀 사다 줄 수 있어요?"),
    Reading(answer: "Since you’re going to the convenience store anyway, can you get me some water?", kor: "편의점에 가는 김에 물 좀 사다 줄 수 있어요?"),
    Reading(answer: "Please don’t forget what I asked you yesterday.", kor: "어제 제가 부탁한 거 잊지 마세요."),
    Reading(answer: "Nobody knew that today was my birthday.", kor: "오늘이 제 생일임을 아무도 몰랐어요."),
    Reading(answer: "He is a Korean person.", kor: "그 사람은 한국 사람이에요."),
    Reading(answer: "I knew that he was Korean.", kor: "그 사람이 한국 사람임을 저는 알고 있었어요."),
    Reading(answer: "He claimed that he was innocent.", kor: "그 사람은 자신이 무죄임을 주장했어요."),
    Reading(answer: "He started learning Korean.", kor: "그 사람은 한국어를 배우기를 시작했어요."),
    Reading(answer: "He is difficult to meet.", kor: "그 사람은 만나기가 어려워요."),
    Reading(answer: "I proved that I am innocent.", kor: "무죄임을 증명했어요."),
    Reading(answer: "He doesn’t know.", kor: "모르고 있음."),
    Reading(answer: "I accidentally dropped my phone while I was getting off the bus.", kor: "버스에서 내리다가 전화기를 떨어뜨려 버렸어요."),
    Reading(answer: "You must carry a document that can prove that you are a student of this university.", kor: "이 대학교의 학생임을 증명할 수 있는 서류를 지참해야 함."),
    Reading(answer: "I accidentally dropped my phone.", kor: "전화기를 떨어뜨려 버렸어요."),
    Reading(answer: "My phone broke.", kor: "전화기가 고장나 버렸어요."),
    Reading(answer: "I ended up buying it.", kor: "사고 말았어요."),
    Reading(answer: "I got busted.", kor: "들키고 말았어요."),
    Reading(answer: "I ended up eating it.", kor: "먹고 말았어요."),
    Reading(answer: "I got there late.", kor: "늦고 말았어요."),
    Reading(answer: "I have made up my mind to really exercise every day this time.", kor: "이번에는 정말로 운동을 매일 하기로 마음 먹었어요."),
    Reading(answer: "I don’t need that book so do whatever you want with it.", kor: "저는 그 책 필요 없으니까 마음대로 하세요."),
    Reading(answer: "Is there a bag that you like?", kor: "마음에 드는 가방 있어요?"),
    Reading(answer: "I keep thinking about what happened yesterday because I feel bad about it.", kor: "어제 있었던 일이 마음에 걸려요."),
    Reading(answer: "Don’t say what you don’t even mean.", kor: "마음에도 없는 말 하지 마세요."),
    Reading(answer: "I feel relieved to hear that.", kor: "그 말을 들으니까 마음이 놓이네요."),
    Reading(answer: "Traveling with friends that you connect well with is a lot of fun.", kor: "마음이 통하는 친구들이랑 여행하면 너무 재미있어요."),
    Reading(answer: "I feel bad because it looks like we lost the game because of me.", kor: "저 때문에 경기에서 진 것 같아서 마음이 무겁습니다."),
    Reading(answer: "You look tired.", kor: "피곤해 보여요."),
    Reading(answer: "This movie looks boring.", kor: "이 영화는 재미없어 보여요."),
    Reading(answer: "This looks spicy, but it’s not spicy at all.", kor: "이거 매워 보이는데, 사실은 하나도 안 매워요."),
    Reading(answer: "The boss doesn’t look happy. Is there anything wrong?", kor: "사장님 기분이 안 좋아 보이는데, 무슨 일 있어요?"),
    Reading(answer: "He looks like a student.", kor: "학생처럼 보여요."),
    Reading(answer: "It looks like a pigeon.", kor: "비둘기처럼 보이네요."),
    Reading(answer: "Someone who looks like a cop took her.", kor: "경찰처럼 보이는 사람이 그 여자를 데려갔어요."),
    Reading(answer: "I regret it.", kor: "후회가 돼요."),
    Reading(answer: "I deeply regret it.", kor: "후회가 막심해요."),
    Reading(answer: "I regret not having played enough when I was little.", kor: "어렸을 때 더 많이 놀지 않은 게 후회가 돼요."),
    Reading(answer: "I regret the fact that I even brought that up.", kor: "그 이야기를 꺼낸 것 자체가 후회스러워요."),
    Reading(answer: "I shouldn’t have told them.", kor: "말하지 말았어야 했어요."),
    Reading(answer: "I should not have told them.", kor: "말하지 말았어야 했어요."),
    Reading(answer: "I shouldn’t have bought it.", kor: "이거 괜히 샀어요."),
    Reading(answer: "I should not have bought it.", kor: "이거 괜히 샀어요."),
    Reading(answer: "I shouldn’t have come here.", kor: "오지 말 걸 그랬어요."),
    Reading(answer: "I should not have come here.", kor: "오지 말 걸 그랬어요."),
    Reading(answer: "It would have been nice if we’d arrived a little earlier.", kor: "좀 더 일찍 도착했더라면 좋았을 텐데요."),
    Reading(answer: "It might have been better to just do it by ourselves.", kor: "그냥 우리끼리 하는 게 나을 뻔 했어요."),
    Reading(answer: "So I’m regretting it now.", kor: "그래서 후회 중이에요."),
    Reading(answer: "I didn’t intend to do it.", kor: "원래 그럴 생각은 없었어요."),
    Reading(answer: "I did not intend to do it.", kor: "원래 그럴 생각은 없었어요."),
    Reading(answer: "Looking back now, I wonder why I did that back then.", kor: "지금 와서 생각해 보면, 제가 그때 왜 그랬나 싶어요."),
    Reading(answer: "I have 100 chickens in my backyard", kor: ""),
    Reading(answer: "I have 90 chickens in my backyard", kor: ""),
    Reading(answer: "Since we have already made a public announcement, we cannot cancel it now.", kor: "이미 공식 발표를 한 이상, 이제 취소할 수는 없어요."),
    Reading(answer: "Now that you’ve boarded the airplane, you can’t get out until you arrive.", kor: "비행기를 탄 이상, 도착할 때까지 내릴 수 없어요."),
    Reading(answer: "Now that you have boarded the airplane, you cannot get out until you arrive.", kor: "비행기를 탄 이상, 도착할 때까지 내릴 수 없어요."),
    Reading(answer: "Once you’ve started, you can’t quit in the middle.", kor: "한번 시작한 이상, 중간에 포기할 수 없어요."),
    Reading(answer: "Once you have started, you cannot quit in the middle.", kor: "한번 시작한 이상, 중간에 포기할 수 없어요."),
    Reading(answer: "Since you’ve come this far, don’t give up and keep working hard.", kor: "여기까지 온 이상, 포기하지 말고 열심히 하세요."),
    Reading(answer: "Once you’ve come into this room, you must play this game.", kor: "이 방에 들어온 이상, 이 게임을 꼭 해야 돼요."),
    Reading(answer: "Once you have come into this room, you must play this game.", kor: "이 방에 들어온 이상, 이 게임을 꼭 해야 돼요."),
    Reading(answer: "Unless you take the airplane, you can’t go that fast.", kor: "비행기를 타지 않는 이상, 그렇게 빨리 갈 수가 없어요."),
    Reading(answer: "Unless I use a calculator, I can’t do such a complex calculation.", kor: "계산기를 쓰지 않는 이상, 이렇게 복잡한 계산은 못 해요."),
    Reading(answer: "Unless I’m very sick, I don’t skip classes.", kor: "아주 아프지 않은 이상, 저는 수업에 빠지지 않아요."),
    Reading(answer: "Unless I am very sick, I don’t skip classes.", kor: "아주 아프지 않은 이상, 저는 수업에 빠지지 않아요."),
    Reading(answer: "Unless you’re a staff member here, you can’t go in.", kor: "여기 직원이 아닌 이상, 들어갈 수가 없어요."),
    Reading(answer: "Unless you are his family, it’s impossible to know such things.", kor: "가족이 아닌 이상, 그런 건 알 수가 없어요."),
    Reading(answer: "Unless it’s something important, I can’t go out at this hour.", kor: "중요한 일이 아닌 이상, 지금 이 시간에 나갈 수는 없어요."),
    Reading(answer: "I am worried that I might regret it later.", kor: "나중에 후회할까 봐 걱정 돼요."),
    Reading(answer: "I was worried that the child might be disappointed, so I didn’t tell him yet.", kor: "아이가 실망할까 봐 아직 말 못 했어요."),
    Reading(answer: "I am worried that we might be late.", kor: "늦을까 봐 걱정이에요."),
    Reading(answer: "I am worried that I might fail the exam.", kor: "시험에 떨어질까 봐 걱정이에요."),
    Reading(answer: "I am worried that the traffic might be bad.", kor: "차가 막힐까 봐 걱정이에요."),
    Reading(answer: "I took a taxi thinking that it might be faster, but I ended up being late.", kor: "택시로 가면 더 빠를까 봐 택시를 탔는데, 결국은 지각했어요."),
    Reading(answer: "I brought an umbrella thinking that it might rain, but it’s not raining.", kor: "비가 올까 봐 우산을 가져왔는데 비가 안 오네요."),
    Reading(answer: "I bought some coffee in case I fall asleep.", kor: "공부하다가 잠이 올까 봐 커피 사왔어요."),
    Reading(answer: "In case you’re hungry, I bought some snacks.", kor: "배고프실까 봐 간식 사왔어요."),
    Reading(answer: "I thought you might need this book, so I brought it.", kor: "이 책 필요하실까 봐 가져왔어요."),
    Reading(answer: "I think maybe I should get some rest today.", kor: "오늘은 좀 쉴까 봐요."),
    Reading(answer: "I think maybe I should ask my friends.", kor: "친구들한테 물어볼까 봐요."),
    Reading(answer: "I am thinking maybe I should just get a refund.", kor: "그냥 환불 받을까 봐요."),
    Reading(answer: "Maybe I should buy this one.", kor: "이걸로 살까 봐요."),
    Reading(answer: "I am thinking maybe I should try studying Japanese.", kor: "일본어를 공부해 볼까 봐요."),
    Reading(answer: "Drive forwards slowly please.", kor: "앞으로 천천히 진입해 주세요."),
    
    Reading(answer: "It rained yesterday, but it’s snowing today.", kor: "어제는 비가 오더니 오늘은 눈이 오네요."),
    Reading(answer: "It was cold in the morning, but now it’s warm.", kor: "아침에는 춥더니 지금은 따뜻하네요."),
    Reading(answer: "My computer slowed down, and now it won’t even switch on.", kor: "제 컴퓨터가 느려지더니, 이제 안 켜져요."),
    Reading(answer: "Those two met in front of a coffee shop, and then exchanged some things.", kor: "두 사람이 커피숍 앞에서 만나더니 뭔가 물건을 교환했어요."),
    Reading(answer: "I read a lot, so my eyes are tired.", kor: "책을 많이 읽었더니 눈이 피곤해요."),
    Reading(answer: "The weather was overcast in the morning, and it ended up snowing in the afternoon.", kor: "아침에 날씨가 흐리더니 오후에는 눈이 왔어요."),
    Reading(answer: "I carried some heavy luggage here, and because of that, my back hurts.", kor: "무거운 짐을 들고 왔더니 허리가 아파요."),
    Reading(answer: "I sang for two hours in a singing room, and I can’t speak now.", kor: "노래방에서 노래를 두 시간 동안 불렀더니 목소리가 안 나와요."),
    Reading(answer: "Can you make some time for me?", kor: "잠깐 시간 좀 내 줄 수 있어요?"),
    Reading(answer: "You don’t have time for this.", kor: "지금 이러고 있을 시간이 어디 있어요?"),
    Reading(answer: "If you have that kind of time, do your studying.", kor: "그럴 시간 있으면 공부나 하세요."),
    Reading(answer: "I hope you can spend a lot of time on this project.", kor: "이번 프로젝트에 시간을 많이 할애해 주세요."),
    Reading(answer: "I want to travel, but I just can’t find the time.", kor: "여행을 가고 싶은데 좀처럼 시간이 안 나네요."),
    Reading(answer: "Stop wasting your time, just go back home.", kor: "괜히 시간 낭비하지 말고 그냥 돌아가세요."),
    Reading(answer: "Do you think I have that much time to waste?", kor: "제가 시간이 남아도는 줄 아세요?"),
    Reading(answer: "I can’t feel the passage of time.", kor: "시간이 어떻게 가는지 모르겠어요."),
    Reading(answer: "I wish I could turn back time to the past.", kor: "시간을 되돌릴 수 있으면 좋겠어요."),
    Reading(answer: "I usually spend time with my family on the weekends.", kor: "저는 주말에는 가족들하고 시간을 보내는 편이에요."),
    Reading(answer: "Excuse me, I’m sorry, but I’d like to ask for directions.", kor: "저기요, 죄송하지만 길 좀 물을게요."),
    Reading(answer: "By any chance, could I ask you for directions?", kor: "혹시 길 좀 물을 수 있을까요?"),
    Reading(answer: "I don’t know either.", kor: "저도 잘 모르겠네요."),
    Reading(answer: "I am not from around here either, so I don’t know.", kor: "저도 여기 사람이 아니라서 잘 모르겠네요."),
    Reading(answer: "Go this way and ask someone one more time.", kor: "이쪽으로 가셔서 다시 한 번 물어보세요."),
    Reading(answer: "It’s a bit of a distance to walk from here. You’ll need to take a bus.", kor: "여기서 걸어가기에는 거리가 좀 있어요. 버스 타셔야 될 거예요."),
    Reading(answer: "I heard you were going to move next month.", kor: "다음 달에 이사간다면서요?"),
    Reading(answer: "I heard it’s already over. Is that right?", kor: "벌써 다 끝났다면서요?"),
    Reading(answer: "Didn’t you say you were still a student?", kor: "아직 학생이라면서요?"),
    Reading(answer: "You said you didn’t know each other that well!", kor: "잘 모르는 사이라면서요!"),
    Reading(answer: "You said you didn’t have a girlfriend!", kor: "여자친구 없다면서요."),
    Reading(answer: "I listen to the music while taking a shower.", kor: "저는 샤워 하면서 노래를 들어요."),
    Reading(answer: "I move my body a lot while sleeping.", kor: "저는 잠을 자면서 많이 움직여요."),
    Reading(answer: "I did a lot of part-time work while going to school.", kor: "저는 학교에 다니면서 아르바이트를 많이 했어요."),
    Reading(answer: "I can’t work while listening to the music.", kor: "저는 노래를 들으면서 일을 할 수가 없어요."),
    Reading(answer: "Don’t talk on the phone while driving.", kor: "운전하면서 전화 통화 하지 마세요."),
    Reading(answer: "Don’t pretend you are not interested when you are excited.", kor: "좋으면서 관심 없는 척 하지 마세요."),
    Reading(answer: "Even as I was preparing for it and everything, I was worried.", kor: "준비는 하면서도 걱정이 됐어요."),
    Reading(answer: "She is a student and model at the same time.", kor: "학생이면서 동시에 모델이에요."),
    Reading(answer: "She is my friend and my teacher at the same time.", kor: "그 사람은 제 친구이면서 동시에 선생님이에요."),
    Reading(answer: "I had a late breakfast, so I don’t feel like having lunch.", kor: "저는 아침을 늦게 먹어서 점심 생각이 없어요."),
    Reading(answer: "Just thinking about it alone gives me goosebumps.", kor: "생각만 해도 소름이 끼쳐요."),
    Reading(answer: "I just thought of you, so I am calling you now.", kor: "그냥 니 생각 나서 전화했어."),
    Reading(answer: "Don’t you feel that this is a bit strange?", kor: "이거 조금 이상하다는 생각 안 들어요?"),
    Reading(answer: "I didn’t intend to surprise you.", kor: "놀래킬 생각은 없었어요."),
    Reading(answer: "We really couldn’t see this coming.", kor: "이건 정말 생각지도 못 했던 결과네요."),
    Reading(answer: "This is really an unexpected result.", kor: "이건 정말 생각지도 못 했던 결과네요."),
    Reading(answer: "It’s needless to think about, he just can’t do it.", kor: "생각해 보고 말 것도 없이, 그 사람은 무조건 안 돼요."),
    Reading(answer: "Needless to say, my answer is no. I can’t let him do it.", kor: "생각해 보고 말 것도 없이, 그 사람은 무조건 안 돼요."),
    Reading(answer: "I know you don’t want to go there, but please attend it just this once, at least for me.", kor: "가기 싫겠지만, 나를 생각해도 한 번만 참석해 줘."),
    Reading(answer: "I look weak, but in fact, I am quite healthy.", kor: "제가 몸이 약해 보이지만, 사실은 아주 건강한 편이에요."),
    Reading(answer: "Long time no see.", kor: "오랜만이에요."),
    Reading(answer: "It’s been a long time.", kor: "이게 얼마만에에요."),
    Reading(answer: "How long has it been since we last met?", kor: "얼마만에 보는 거죠?"),
    Reading(answer: "Everything alright?", kor: "별일 없죠?"),
    Reading(answer: "How are you doing these days?", kor: "요새 어떻게 지내요?"),
    Reading(answer: "The last time we met was already two years ago?", kor: "지난 번에 본 게 벌써 2년 전이에요?"),
    Reading(answer: "We haven’t met since last fall, right?", kor: "작년 가을에 보고 못 봤죠?"),
    Reading(answer: "Let’s stay in touch more often from now on.", kor: "앞으로는 자주 연락 하고 지내요."),
    Reading(answer: "Why is it so hard to meet you?", kor: "왜 그렇게 얼굴 보기가 힘들어요?"),
    Reading(answer: "It’s been a long time and you haven’t changed a bit.", kor: "오랜만에 만났는데 하나도 안 변했네요?"),
    Reading(answer: "We are meeting for the first time in three years, right?", kor: "3년 전에 보고 처음 보는 거죠?"),
    Reading(answer: "You’re exactly the same as before.", kor: "옛날 그대로네요."),
    Reading(answer: "You haven’t changed a bit.", kor: "옛날 그대로네요."),
    Reading(answer: "It’s more expensive than I thought.", kor: "생각보다 비싸요."),
    Reading(answer: "This place is so big!", kor: "여기 진짜 넓구나!"),
    Reading(answer: "So this was what you were talking about!", kor: "이게 그거였군요!"),
    Reading(answer: "So this is how you do it!", kor: "이렇게 하는 거군요."),
    Reading(answer: "Please don’t pretend you don’t know and tell me quickly.", kor: "모르는 척하지 말고 빨리 말해 줘요."),
    Reading(answer: "Stop pretending to be asleep and get up.", kor: "자는 척 그만하고 일어나요."),
    Reading(answer: "Don’t pretend that you drank.", kor: "술 마신 척하지 마세요."),
    Reading(answer: "Don’t pretend to know.", kor: "아는 척하지 마세요."),
    Reading(answer: "It’s possible.", kor: "그럴 만해요."),
    Reading(answer: "It’s understandable why he is popular.", kor: "그 사람은 인기가 있을 만해요."),
    Reading(answer: "Is this book worth reading?", kor: "이 책 읽을 만해요?"),
    Reading(answer: "I’m okay. It’s bearable.", kor: "괜찮아요. 참을 만해요."),
    Reading(answer: "Try doing it like I do.", kor: "저처럼 해 보세요."),
    Reading(answer: "He speaks Korean well like a Korean person.", kor: "그 사람은 한국어를 한국 사람처럼 잘해요."),
    Reading(answer: "Did you do it like I said yesterday?", kor: "제가 어제 말한 것처럼 했어요?"),
    Reading(answer: "Do it together with that person.", kor: "저 사람이랑 같이 하세요."),
    Reading(answer: "The puppy looks like a bear.", kor: "강아지가 곰처럼 생겼어요."),
    Reading(answer: "Why did you make your house like a fortress?", kor: "왜 집을 요새처럼 만들었어요?"),
    Reading(answer: "Did you really believe that like a fool?", kor: "바보처럼 정말 그 말을 믿었어요?"),
    Reading(answer: "Take as much as you want.", kor: "원하는 만큼 다 가져가세요."),
    Reading(answer: "Take as much as you need.", kor: "필요한 만큼 가져가세요."),
    Reading(answer: "Take just the amount you need.", kor: "필요한 만큼만 가져가세요."),
    Reading(answer: "We don’t meet as often as in Korea.", kor: "한국에서만큼 자주 안 만나요."),
    Reading(answer: "Even if you go, it will be a waste of your time.", kor: "가 봤자 시간 낭비예요."),
    Reading(answer: "There is no use in talking to me.", kor: "저한테 말해 봤자 소용 없어요."),
    Reading(answer: "Even if you stay here, it’s a waste of time.", kor: "여기에 있어 봤자 시간 낭비예요."),
    Reading(answer: "Even if you leave now, you can’t get there in time.", kor: "지금 출발해 봤자 시간 안에 못 가요."),
    Reading(answer: "Even if you cry, it won’t help.", kor: "울어 봤자 소용 없어요."),
    Reading(answer: "Even if you pretend you don’t know, I already know all about it.", kor: "모르는 척 해 봤자 이미 다 알고 있어요."),
    Reading(answer: "It was raining so I brought my umbrella.", kor: "비가 오길래 우산을 가져왔어요."),
    Reading(answer: "It was delicious so I bought some more.", kor: "맛있길래 더 사왔어요."),
    Reading(answer: "There were a lot of people so I just left the place.", kor: "사람이 많길래 그냥 나왔어요."),
    Reading(answer: "It looked like it was going to rain, so I just stayed at home.", kor: "비가 올 것 같길래 그냥 집에 있었어요."),
    Reading(answer: "The bookstore looked like it was going to close soon so I just came back.", kor: "서점이 곧 문을 닫을 것 같길래 그냥 돌아왔어요."),
    Reading(answer: "What did you do to be so tired?", kor: "뭐 했길래 이렇게 지쳤어요?"),
    Reading(answer: "What did they tell you? Why are you studying so hard?", kor: "무슨 이야기를 들었길래 그렇게 열심히 공부해요?"),
    Reading(answer: "Where are you going to be packing so much?", kor: "어디에 가길래 그렇게 짐을 많이 싸요?"),
    Reading(answer: "Where are you going? You’re packing so much stuff!", kor: "어디에 가길래 그렇게 짐을 많이 싸요?"),
    Reading(answer: "Who are you meeting to be putting on so much make-up?", kor: "누구를 만나길래 그렇게 화장을 열심히 해요?"),
    Reading(answer: "Why are you making so much effort on your make-up? Who are you meeting?", kor: "누구를 만나길래 그렇게 화장을 열심히 해요?"),
    Reading(answer: "I couldn’t go because I was working.", kor: "일하느라고 못 갔어요."),
    Reading(answer: "I was working so I couldn’t go.", kor: "일하느라고 못 갔어요."),
    Reading(answer: "I’m busy preparing for an exam.", kor: "시험 준비 하느라고 바빠요."),
    Reading(answer: "I opened the refrigerator for a little bit to look for something to eat.", kor: "먹을 것을 찾느라고 잠깐 냉장고를 열었어요."),
    Reading(answer: "I was working out so I didn’t know that you were calling.", kor: "운동하느라고 전화 온 줄 몰랐어요."),
    Reading(answer: "I was working out so I didn’t know I received a phone call.", kor: "운동하느라고 전화 온 줄 몰랐어요."),
    Reading(answer: "I was cleaning so I stayed at home all along.", kor: "청소하느라고 계속 집에 있었어요."),
    Reading(answer: "I stayed at home all day because I was cleaning.", kor: "청소하느라고 계속 집에 있었어요."),
    Reading(answer: "What were you doing to be so late?", kor: "뭐 하느라고 이렇게 늦었어요?"),
    Reading(answer: "Why are you so late?", kor: "뭐 하느라고 이렇게 늦었어요?"),
    Reading(answer: "I spent all the money paying for my tuition fees.", kor: "학비를 내느라고 돈을 다 썼어요."),
    Reading(answer: "He’s listening to music now so no matter how much you try to call him, he can’t hear you.", kor: "그 사람은 지금 음악 듣느라고, 아무리 불러 봤자 못 들어요."),
    Reading(answer: "What did you say to make him pretend not to know me?", kor: "뭐라고 말했길래 그 사람이 저를 모르는 척 해요?"),
    Reading(answer: "You really did like I said!", kor: "제가 말한 것처럼 했군요!"),
    Reading(answer: "Don’t make the kids cry.", kor: "아이들 울리지 마세요."),
    Reading(answer: "I am raising three kids.", kor: "아이 세 명을 키우고 있어요."),
    Reading(answer: "I saw that movie yesterday, and it was fun!", kor: "그 영화 어제 봤는데, 재밌더라!"),
    Reading(answer: "I went to Singapore for the first time, and it’s really hot there.", kor: "싱가폴에 처음 가 봤는데, 정말 덥더라."),
    Reading(answer: "No matter how much you hate him, please pretend you don’t hate him.", kor: "아무리 싫어도, 안 싫은 척 해 주세요."),
    Reading(answer: "No matter how delicious it is, stop eating now.", kor: "아무리 맛있어도 이제 그만 먹어요."),
    Reading(answer: "No matter how expensive it is, I’ll buy it for you.", kor: "아무리 비싸도 제가 사 줄게요."),
    Reading(answer: "Even if you are a student, you don’t always study.", kor: "아무리 학생이라도 공부만 하는 건 아니에요."),
    Reading(answer: "Even students don’t always study.", kor: "아무리 학생이라도 공부만 하는 건 아니에요."),
    Reading(answer: "How do you do this?", kor: "이거 어떻게 해요?"),
    Reading(answer: "What did you say this was?", kor: "이거 뭐라고 했죠?"),
    Reading(answer: "Whose is this? I forgot.", kor: "이거 누구 거더라?"),
    Reading(answer: "What was his name again?", kor: "그 사람 이름이 뭐더라?"),
    Reading(answer: "What time did you say you were going to come tomorrow?", kor: "내일 몇 시에 올 거라고 했죠?"),
    Reading(answer: "What was this in Korean again?", kor: "이게 한국어로 뭐였죠?"),
    Reading(answer: "I said, come here quickly!", kor: "빨리 오라니까요."),
    Reading(answer: "I said I got it!", kor: "알았다니까요!"),
    Reading(answer: "I said I understood!", kor: "알았다니까요!"),
    Reading(answer: "I said I didn’t do it!", kor: "제가 안 했다니까요."),
    Reading(answer: "I told you I’m innocent.", kor: "저는 죄가 없다니까요."),
    Reading(answer: "I said I’m going alone!", kor: "혼자 갈 거라니까요."),
    Reading(answer: "I said I really didn’t know.", kor: "저는 정말 몰랐다니까요."),
    Reading(answer: "I said I exercise everyday.", kor: "매일 운동한다니까요."),
    Reading(answer: "I said I’m going to study hard starting next month!", kor: "다음달부터 열심히 공부할 거라니까요."),
    Reading(answer: "What did they say?", kor: "뭐라고 했어요?"),
    Reading(answer: "They said they would come tomorrow.", kor: "내일 온다고 했어요."),
    Reading(answer: "When did they say they would come?", kor: "언제 온다고 했어요?"),
    Reading(answer: "I heard that this is fun.", kor: "이거 재미있다고 들었어요."),
    Reading(answer: "He says he’s never come to Korea.", kor: "그 사람은 한국에 와 본 적이 없대요."),
    Reading(answer: "My friend says he will come to Korea.", kor: "제 친구가 한국에 올 거래요."),
    Reading(answer: "My friend says she’s moving tomorrow.", kor: "친구가 내일 이사 간대요."),
    Reading(answer: "They say this person is a very famous person.", kor: "이 사람 정말 유명한 사람이래요."),
    
    Reading(answer: "How about tomorrow?", kor: "내일 어때요?"),
    Reading(answer: "How about doing it again?", kor: "다시 하는 거 어때요?"),
    Reading(answer: "How about asking other people?", kor: "다른 사람한테 물어보는 거 어때요?"),
    Reading(answer: "How about going inside?", kor: "안으로 들어가는 거 어때요?"),
    Reading(answer: "You don’t like this? How about this one?", kor: "이거 싫어요? 이거(는) 어때요?"),
    Reading(answer: "Do you mind if I sit here?", kor: "여기 앉아도 돼요?"),
    Reading(answer: "Do you mind if I close the window?", kor: "창문 닫아도 돼요?"),
    Reading(answer: "Do you mind if I leave first?", kor: "저 먼저 가도 괜찮아요?"),
    Reading(answer: "Do you mind if I try opening this?", kor: "이거 열어 봐도 괜찮아요?"),
    Reading(answer: "Do you mind if I tell you tomorrow?", kor: "내일 말해 줘도 괜찮아요?"),
    Reading(answer: "Do you mind if I call you later?", kor: "나중에 전화해도 될까요?"),
    Reading(answer: "Can I call you later?", kor: "나중에 전화해도 될까요?"),
    Reading(answer: "Do you mind waiting for a bit?", kor: "조금 기다려 주실래요?"),
    Reading(answer: "I am on my way.", kor: "가고 있는 중이에요."),
    Reading(answer: "I am in the middle of going.", kor: "가고 있는 중이에요."),
    Reading(answer: "What were you doing?", kor: "뭐 하고 있는 중이었어요?"),
    Reading(answer: "What were you in the middle of doing?", kor: "뭐 하고 있는 중이었어요?"),
    Reading(answer: "I was in the middle of looking for the key.", kor: "열쇠를 찾고 있는 중이었어요."),
    Reading(answer: "What were you doing?", kor: "뭐 하는 중이었어요?"),
    Reading(answer: "I didn’t do anything.", kor: "What were you doing?"),
    Reading(answer: "Did you buy everything?", kor: "다 샀어요?"),
    Reading(answer: "I am still in the middle of choosing.", kor: "아직 고르는 중이에요."),
    Reading(answer: "I will come back.", kor: "다시 올 거예요."),
    Reading(answer: "I will come again.", kor: "다시 올 거예요."),
    Reading(answer: "I will come back anyway.", kor: "어차피 다시 올 거예요."),
    Reading(answer: "They will come again one way or the other.", kor: "어차피 다시 올 거예요."),
    Reading(answer: "It’s not something that I can do.", kor: "제가 할 수 있는 일이 아니에요."),
    Reading(answer: "Even if I try, it’s not something that I can do.", kor: "어차피 제가 할 수 있는 일이 아니에요."),
    Reading(answer: "Don’t bother asking me. It’s not something that I can do.", kor: "어차피 제가 할 수 있는 일이 아니에요."),
    Reading(answer: "It’s already obvious. I can’t do it.", kor: "어차피 제가 할 수 있는 일이 아니에요."),
    Reading(answer: "You’re late, so hurry up!", kor: "늦었으니까 빨리 와."),
    Reading(answer: "You’re late already, so take your time.", kor: "어차피 늦었으니까 천천히 와."),
    Reading(answer: "I am on my way there anyway.", kor: "어차피 저도 지금 거기 가는 중이에요."),
    Reading(answer: "You mean you are giving this to me?", kor: "그러니까 이거 저 준다고요?"),
    Reading(answer: "I mean, I already finished it.", kor: "그러니까, 벌써 다 했다고요."),
    Reading(answer: "I mean, for this work, this person is the best.", kor: "그러니까 제 말은, 이 일에는 이 사람이 최고라고요."),
    Reading(answer: "You mean you are going there alone?", kor: "그러니까 혼자 간다는 말이에요?"),
    Reading(answer: "I mean, you are going there alone?", kor: "그러니까 혼자 간다는 말이에요?"),
    Reading(answer: "I went there last Saturday, I mean, Sunday.", kor: "지난 주 토요일에, 아니, 일요일에 갔어요."),
    Reading(answer: "Give me this one, I mean, this one.", kor: "이거, 아니, 이거 주세요."),
    Reading(answer: "I’m going to sell my camera.", kor: "카메라 팔 거예요."),
    Reading(answer: "What do you mean? You don’t even have a camera!", kor: "무슨 말이에요? 카메라도 없잖아요."),
    Reading(answer: "You are going to quit? What do you mean all of a sudden?", kor: "그만둘 거라고요? 갑자기 무슨 말이에요?"),
    Reading(answer: "I’m not sure what you mean.", kor: "무슨 말인지 잘 모르겠어요."),
    Reading(answer: "I don’t know what you are talking about.", kor: "무슨 말인지 잘 모르겠어요."),
    Reading(answer: "I know what you mean.", kor: "무슨 말인지 알겠어요."),
    Reading(answer: "I understand what you are saying.", kor: "무슨 말인지 알겠어요."),
    Reading(answer: "What is love?", kor: "사랑이란 무엇일까요?"),
    Reading(answer: "Love is not easy.", kor: "사랑이란 쉽지 않아요."),
    Reading(answer: "Where would you like to go?", kor: "어디로 가시겠어요?"),
    Reading(answer: "I’ll do it.", kor: "제가 하겠습니다."),
    Reading(answer: "I won’t tell you.", kor: "말하지 않겠습니다."),
    Reading(answer: "That must hurt.", kor: "아프겠어요."),
    Reading(answer: "I think this will be good.", kor: "이게 좋겠어요."),
    Reading(answer: "Do you think you could handle it on your own?", kor: "혼자서도 되겠어요?"),
    Reading(answer: "Even I would be able to fit in.", kor: "저도 들어가겠네요."),
    Reading(answer: "I got it. I understand.", kor: "알겠습니다."),
    Reading(answer: "I’m so tired. This is so tough.", kor: "힘들어 죽겠어요."),
   
    
    Reading(answer: "He says he doesn’t know where it is.", kor: "어딘지 모른대요."),
    Twister(answer: "She sells seashells by the seashore."),
    Twister(answer: "How much pot, could a pot roast roast, if a pot roast could roast pot?"),
    Twister(answer: "How much wood would a woodchuck chuck if a woodchuck could chuck wood?"),
    Twister(answer: "How can a clam cram in a clean cream can?"),
    Twister(answer: "I scream, you scream, we all scream for ice cream"),
    Twister(answer: "I saw a kitten eating chicken in the kitchen."),
    Twister(answer: "I thought I thought of thinking of thanking you."),
    Twister(answer: "I wish to wash my Irish wristwatch."),
    Twister(answer: "A big black bear sat on a big black rug."),
    Twister(answer: "So, this is the sushi chef."),
    Twister(answer: "We surely shall see the sun shine soon."),
    Twister(answer: "Quizzical quiz, kiss me quick."),
    Twister(answer: "A proper copper coffee pot."),
    Twister(answer: "Stupid superstition, Stupid superstition."),
    Twister(answer: "Truly rural, Truly rural."),
    Twister(answer: "Real rock wall, real rock wall, real rock wall."),
    Twister(answer: "Supposed to be pistachio, supposed to be pistachio."),
    Twister(answer: "The queen in green screamed."),
    Twister(answer: "Rolling Red Wagons, Rolling Red Wagons."),
    Twister(answer: "Round the rough and rugged rock the ragged rascal rudely ran."),
    Twister(answer: "She sees cheese, She sees cheese."),
    Twister(answer: "Black Background, Brown Background, Black Background, Brown Background."),
    Twister(answer: "World Wide Web, World Wide Web, World Wide Web."),
    Twister(answer: "Pirates Private Property, Pirates Private Property."),
    Twister(answer: "Tiny timid toads trying to trot to town."),
    Twister(answer: "Sick sticky skeletons, sick sticky skeletons, sick sticky skeletons."),
    Twister(answer: "I want to be a juror on a rural brewery robbery case."),
    
    AtInOn(phraseStart: "By eleven o'clock", phraseEnd: "the evening, I am in bed.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "What day were you born", phraseEnd: "?", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "I don't jump", phraseEnd: "the pool before testing the water temperature.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "Do you like to shop", phraseEnd: "the supermarket down the street?", answer: ChoiceAtInOn.At),
    AtInOn(phraseStart: "I swim in the pool", phraseEnd: "the local school campus.", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "Do you live", phraseEnd: "Los Angeles?", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "My birthday will be", phraseEnd: "a few months.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "Her grandmother will arrive there", phraseEnd: "half-past seven in the morning.", answer: ChoiceAtInOn.At),
    AtInOn(phraseStart: "Is the water", phraseEnd: "your foot warm or cold?", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "Did you grow up", phraseEnd: "Mexico or California?", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "My daughter was born", phraseEnd: "the last day of July.", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "I like to put make-up", phraseEnd: "when I dress up.", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "I like to swim", phraseEnd: "the beach, not just in the pool.", answer: ChoiceAtInOn.At),
    AtInOn(phraseStart: "At eight o'clock in the morning, I am hard", phraseEnd: "work.", answer: ChoiceAtInOn.At),
    AtInOn(phraseStart: "Put your big toe", phraseEnd: "the water.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "He arrived", phraseEnd: "the park two hours before the game.", answer: ChoiceAtInOn.At),
    AtInOn(phraseStart: "He comes to school", phraseEnd: "nine o'clock every Thursday morning.", answer: ChoiceAtInOn.At),
    AtInOn(phraseStart: "Your keys were", phraseEnd: "the seat of the car all the time.", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "The train arrives", phraseEnd: "the station just after four o'clock in the afternoon.", answer: ChoiceAtInOn.At),
    AtInOn(phraseStart: "That book must be", phraseEnd: "good condition when you return it.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "We celebrate the coming new year on New Year's Eve", phraseEnd: "the end of each year.", answer: ChoiceAtInOn.At),
    AtInOn(phraseStart: "He shouted", phraseEnd: "me as I drove past his house.", answer: ChoiceAtInOn.At),
    AtInOn(phraseStart: "I like to study", phraseEnd: "the evening.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "Jerry has a cut", phraseEnd: "his left knee.", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "He lives", phraseEnd: "the brown house next to the restaurant.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "Please place the suitcase", phraseEnd: "the back seat of my car.", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "Something was cooking", phraseEnd: "the kitchen when we came home.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "His house used to be", phraseEnd: "Elm Street but he doesn't live there anymore.", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "Many different roses grow", phraseEnd: "my garden.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "Today I am", phraseEnd: "a very good mood. How about you?", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "There is no meat", phraseEnd: "the menu tonight.", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "When I looked up, she was smiling", phraseEnd: "me.", answer: ChoiceAtInOn.At),
    AtInOn(phraseStart: "She dropped her keys", phraseEnd: "the sidewalk.", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "It gets very cold", phraseEnd: "winter.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "Betty doesn't have a job", phraseEnd: "the moment.", answer: ChoiceAtInOn.At),
    AtInOn(phraseStart: "The telephone and the doorbell rang", phraseEnd: "the same time.", answer: ChoiceAtInOn.At),
    AtInOn(phraseStart: "He flew from Japan. He's probably", phraseEnd: "Perth now.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "Would you like to go out to dinner", phraseEnd: "Friday night?", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "She was tired. She's", phraseEnd: "bed now.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "Goodbye! I'll see you", phraseEnd: "the morning.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "Were you", phraseEnd: "Tom's party last night?", answer: ChoiceAtInOn.At),
    AtInOn(phraseStart: "I'll see you", phraseEnd: "two weeks time.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "She was born", phraseEnd: "1961.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "The doctor will see you", phraseEnd: "10:00 in the morning.", answer: ChoiceAtInOn.At),
    AtInOn(phraseStart: "My wife gave me a wonderful present", phraseEnd: "my birthday.", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "The coffee is", phraseEnd: "the shelf.", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "My pen is", phraseEnd: "my pencil case.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "He's gone to work. He's probably", phraseEnd: "at the office right now.", answer: ChoiceAtInOn.At),
    AtInOn(phraseStart: "He lives", phraseEnd: "Australia.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "I'll see you", phraseEnd: "Monday.", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "Buy some bread and milk", phraseEnd: "your way home.", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "What will you be doing", phraseEnd: "New Year's Eve?", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "The flowers", phraseEnd: "your garden are very beautiful.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "There were many cars", phraseEnd: "the road today.", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "Tom and Betty always go out to dinner", phraseEnd: "their wedding aniversary.", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "We got up", phraseEnd: "dawn today.", answer: ChoiceAtInOn.At),
    AtInOn(phraseStart: "Are you doing anything", phraseEnd: "the weekend?", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "We live", phraseEnd: "this address.", answer: ChoiceAtInOn.At),
    AtInOn(phraseStart: "I live", phraseEnd: "an apartment building.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "My apartment building is", phraseEnd: "the corner.", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "My apartment is", phraseEnd: "the fifth floor.", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "My friend lives", phraseEnd: "27 Strong Street.", answer: ChoiceAtInOn.At),
    AtInOn(phraseStart: "He lives", phraseEnd: "apartment 501.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "I live", phraseEnd: "the top floor.", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "It's the fifth door", phraseEnd: "your left.", answer: ChoiceAtInOn.On),
    AtInOn(phraseStart: "That apartment was", phraseEnd: "the basement.", answer: ChoiceAtInOn.In),
    AtInOn(phraseStart: "I used to live", phraseEnd: "12 Harrison Street.", answer: ChoiceAtInOn.At),
    
    // pool, pull, full, fool
    // feel, fill, peel, pill
    // bag, back, beg
]

struct Quiz {
    var quests: [Quest] = questions
    var index: Int = 0
    var limitScore = 20
    var limitQuest: Int = questions.count - 1
    var limitRead: Int = 3
    var streak: Int = 0
    var questsWrong: [String] = []
    var questsWrongText: String {
        let phrases = Set(questsWrong.map {"* \($0)"})
        let lines = phrases.joined(separator: "\n")
        return "Questions the student got wrong\n\(lines)"
    }
    var questsWrongHtml: String {
        let phrases = Set(questsWrong.map {"<li>\($0)</li>"})
        let lines = phrases.joined()
        return "<h1>Questions the student got wrong</h1><ul>\(lines)</ul>"
    }
    
    var delayRead: Double = 5 // time limit for reading
    var delayReadRegular: Double = 7 // time limit for reading regular pronunciation exercises
    var delayReadTwister: Double = 9 // time limit for reading tongue twisters
    
    var timeRead: Float = 0
    
    var attempts: Int = 0
    var score: Int = 0
    var current: Quest {
        get {
            return quests[index]
        }
    }
    
    struct AttrCat {
        var attribute: String
        var category: String
        init(_ attribute: String, _ category: String) {
            self.attribute = attribute
            self.category = category
        }
    }
    let attrCats = [
        AttrCat("withOnAbout", "select-withonabout"),
        AttrCat("atInOn", "select-atinon"),
        AttrCat("adjAdvType", "select-adjoradvtype"),
        AttrCat("adjAdvVal", "select-adjoradvval"),
        AttrCat("futureGoingTo", "select-futuregoingto"),
        AttrCat("toeicGrammar", "select-toeicgrammar"),
        AttrCat("mathFractions", "select-mathfractions"),
        AttrCat("advFreq", "select-advfreq"),
        AttrCat("adjComp", "select-adjcomp"),
        AttrCat("wordPos", "select-position"),
        AttrCat("pronunciation", "reading"),
        AttrCat("tongueTwisters", "reading-tonguetwister"),
    ]
    
    let categoryMap = [
        "select-withonabout": "With / On / About",
        "select-atinon": "At / In / On",
        "select-adjoradvtype": "Adjective or Adverb?",
        "select-adjoradvval": "Correct Adjective/Adverb Selection",
        "select-futuregoingto": "Future Tense: Going To",
        "select-toeicgrammar": "TOEIC: Grammar",
        "select-mathfractions": "Math Vocabulary: Fractions",
        "select-advfreq": "Adverbs of Frequency",
        "select-adjcomp": "Adjectives of Comparison",
        "select-position": "Correct Word Position",
        "reading": "Pronunciation: General",
        "reading-tonguetwister": "Pronunciation: Tongue Twister",
    ]
    
    mutating func applyFilters() {
        guard let currentSetting = getSettings() else {
            return
        }
        quests = questions
        for attrCat in attrCats {
            if let val = currentSetting.value(forKey: attrCat.attribute) as? Bool {
                if !val {
                    quests = quests.filter {$0.category != attrCat.category}
                }
            }
        }
        if let timePronunciation = currentSetting.value(forKey: "timePronunciation") as? Int8 {
            delayReadRegular = Double(timePronunciation)
        }
        if let timeTongueTwisters = currentSetting.value(forKey: "timeTongueTwisters") as? Int8 {
            delayReadTwister = Double(timeTongueTwisters)
        }
        index = 0
        limitQuest = quests.count - 1
        quests.shuffle()
    }
    mutating func appendWrongQuest() {
        let q = current
        let _phraseStart = q.phraseStart == "" ? "" : "\(q.phraseStart) "
        let _answer = q.answer == "" ? "" : "\(q.answer) "
        let _phraseEnd = q.phraseEnd == "" ? "" : "\(q.phraseEnd) "
        var _category = ""
        if let cat = categoryMap[q.category] {
            _category = " (\(cat))"
        }
        let qStr = _phraseStart + _answer + _phraseEnd + _category
        questsWrong.append(qStr)
    }
    mutating func questsWrongReset() {questsWrong.removeAll()}
    mutating func streakReset() {streak = 0}
    mutating func attemptsInc() {attempts += 1}
    mutating func attemptsReset() {attempts = 0}
    mutating func timeReadInc() {timeRead += 1}
    mutating func timeReadReset() {timeRead = 0}
    mutating func setDelayRead(_ delay: Double) {delayRead = delay}
    mutating func scoreReset() {score = 0}
    mutating func scoreInc() {
        score += 1
        streak += 1
    }
    mutating func next() {
        if index < limitQuest {
            index += 1
        } else {
            index = 0
            quests.shuffle()
        }
    }
}

