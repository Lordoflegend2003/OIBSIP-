class Question{

  final String questionText;
  final List<Answer> answerList;

  Question(this.questionText , this.answerList);

}



class Answer{
  final String answerText;
  final bool isCorrect;


  Answer(this.answerText , this.isCorrect);
}



List<Question> getQuestions(){
  List<Question> list = [];

  list.add(
    Question("Who is the Prime Minister of India?",
    [
      Answer("Indira Gandhi", false),
      Answer("Narendra Modi", true),
      Answer("Mahatma Gandhi", false),
      Answer("Raghul Gandhi", false),
    ],
    )
    );

    list.add(
    Question("Who Own's of Apple",
    [
      Answer("Jeff Bezzos", false),
      Answer("Steve Jobs", true),
      Answer("Elon Musk", false),
      Answer("Sundar Pichai", false),
    ],
    )
    );


    list.add(
    Question("Who is the CEO of Google",
    [
      Answer("Jeff Bezzos", false),
      Answer("Elon Musk", false),
      Answer("Sundar Pichai", true),
      Answer("Steve Jobs", false),
    ],
    )
    );


    list.add(
    Question("Who Own's Tesla",
    [
     Answer("Jeff Bezzos", false),
      Answer("Elon Musk", true),
      Answer("Sundar Pichai", false),
      Answer("Steve Jobs", false),
    ],
    )
    );


  return list;
}