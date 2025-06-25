import '../models/question.dart';


List<Question> questions = [
  Question(
    questionText: 'マスクメロンの「マスク」の意味とは？',
    answers: [
      Answer(text: '香り', isCorrect: true),
      Answer(text: '網目模様', isCorrect: false),
      Answer(text: '仮面', isCorrect: false),
      Answer(text: '色', isCorrect: false),
    ],
  ),
  Question(
    questionText: '体の骨の数、大人と子供で多いのは？',
    answers: [
      Answer(text: '子供', isCorrect: true),
      Answer(text: '大人', isCorrect: false),
      Answer(text: 'どちらも同じ', isCorrect: false),
    ],
  ),
  Question(
    questionText: 'よく、部屋の中に誰もいない状態のことをガラーンとしていると言いますが、この言葉の語源はどこから来たか？',
    answers: [
      Answer(text: 'お寺', isCorrect: true),
      Answer(text: '神社', isCorrect: false),
      Answer(text: '古墳', isCorrect: false),
      Answer(text: 'お堂', isCorrect: false),
    ],
  ),
  Question(
    questionText: 'ニシローランドゴリラに一番多い血液型は？',
    answers: [
      Answer(text: 'B型', isCorrect: true),
      Answer(text: 'O型', isCorrect: false),
      Answer(text: 'A型', isCorrect: false),
      Answer(text: 'AB型', isCorrect: false),
    ],
  ),
];
