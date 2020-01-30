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
        self.kor = self.noKor ? "*한국어 버전은 아직 없습니다*" : kor;
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
            title: "Prepositions (전치사)",
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
            title: "Prepositions (전치사)",
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
            title: "Adjectives/Adverbs",
            subtitle: "Ending with -ly",
            category: "select-adjoradvtype",
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
            title: "Adjective or Adverb",
            subtitle: "형용사 또는 부사",
            category: "select-adjoradv",
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
            title: "Positive Statements",
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
            title: "Who are celebrities?",
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
            title: "Free Time Trends",
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
            title: "Random Question",
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
            title: "Random Question",
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
            title: "Math: Fractions",
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
            title: "Adverbs of Frequency",
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
            title: "Word Position",
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
            subtitle: "아래의 영어 문장을 읽어보십시오.",
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
            subtitle: "아래의 영어 문장을 읽어보십시오.",
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
            title: "Adjective Comparison",
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
        phraseEnd: ". pizza for lunch today.",
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
    Reading(answer: "The neighbors are too loud.", kor: "이웃이 너무 시끄러워요."),
    Reading(answer: "The neighbor's dog keeps barking.", kor: "이웃집 강아지가 계속 짖어요."),
    Reading(answer: "I would like to find housing around here.", kor: "이 근처의 집을 구하고 싶어요."),
    Reading(answer: "I would like to find a studio apartment.", kor: "원룸 구하고 싶어요."),
    Reading(answer: "How much is the monthly rent?", kor: "월세 얼마예요?"),
    Reading(answer: "How much is the deposit?", kor: "보증금 얼마예요?"),
    Reading(answer: "How far is it from the subway station?", kor: "지하철역에서 얼마나 걸려요?"),
    Reading(answer: "This is too small.", kor: "너무 작아요."),
    Reading(answer: "This is too big.", kor: "너무 커요."),
    Reading(answer: "This is too expensive.", kor: "너무 비싸요."),
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
    Reading(answer: "My mother has an open hand, so she always cooks too much food.", kor: " 저희 어머니는 손이 커서 항상 음식을 너무 많이 하세요."),
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
    Reading(answer: "It was too dark, so I ended up hitting my head against the wall.", kor: "너무 어두워서 머리를 벽에 부딪히고 말았어요."),
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
    Reading(answer: "I’d love to help you, but I am too busy today.", kor: "도와주고 싶은 마음은 굴뚝 같지만, 오늘은 너무 바빠요."),
    Reading(answer: "I feel relieved to hear that.", kor: "그 말을 들으니까 마음이 놓이네요."),
    Reading(answer: "Traveling with friends that you connect well with is a lot of fun.", kor: "마음이 통하는 친구들이랑 여행하면 너무 재미있어요."),
    Reading(answer: "I feel bad because it looks like we lost the game because of me.", kor: "저 때문에 경기에서 진 것 같아서 마음이 무겁습니다."),
    Reading(answer: "You look tired.", kor: "피곤해 보여요."),
    Reading(answer: "This movie looks boring.", kor: "이 영화는 재미없어 보여요."),
    Reading(answer: "This looks spicy, but it’s not spicy at all.", kor: "이거 매워 보이는데, 사실은 하나도 안 매워요."),
    Reading(answer: "This cake looked delicious so I bought it, but it’s too sweet.", kor: "이 케이크가 맛있어 보여서 샀는데, 너무 달아요."),
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
    Reading(answer: "Since we’ve already made a public announcement, we can’t cancel it now.", kor: "이미 공식 발표를 한 이상, 이제 취소할 수는 없어요."),
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
    Reading(answer: "Drive forwards slowly please.", kor: "앞으로 천천히 진입해 주세요"),
    


    Twister(answer: "She sells seashells by the seashore."),
    Twister(answer: "How many sheets could a sheet slitter slit if a sheet slitter could slit sheets?"),
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
    Twister(answer: "You cuss, I cuss, we all cuss, for asparagus!"),
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
    ].shuffled()

struct Quiz {
    var quests: [Quest] = questions
    var index: Int = 0
    var limitScore = 20
    var limitQuest: Int = questions.count - 1
    var limitRead: Int = 3
    
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
    
    mutating func attemptsInc() {
        attempts += 1
    }
    
    mutating func attemptsReset() {
        attempts = 0
    }
    
    mutating func timeReadInc() {
        timeRead += 1
    }
    
    mutating func timeReadReset() {
        timeRead = 0
    }
    
    mutating func setDelayRead(_ delay: Double) {
        delayRead = delay
    }
    
    mutating func setDelayReadByCat(_ category: String) {
        switch category {
        case "reading":
            setDelayRead(delayReadRegular)
        case "reading-tonguetwister":
            setDelayRead(delayReadTwister)
        default:
            setDelayRead(delayReadRegular)
        }
    }
    
    mutating func scoreReset() {
        score = 0
    }
    
    mutating func scoreInc() {
        score += 1
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

