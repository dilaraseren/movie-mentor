import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPage();
}

class _FaqPage extends State<FaqPage> {
  final questions = [
  {
    'question': 'MovieMentor Uygulaması Amacı Nedir?',
    'answer': 'MovieMentor aracılığıyla size öneride bulunarak film araştırmalarınıza yardımcı olur.'
  },
  {
    'question': 'Verilerin işlenmesi ile ilgili nasıl bir çalışma yapıldı?',
    'answer': 'Veriler Netflix verilerinin Keşifçi Veri Analizi kullanarak işlenmesi ile sonuçlandırılmıştır.'
  },
  {
    'question': 'Kullanılan teknolojiler nelerdir?',
    'answer': 'Flutter, Dart,Firebase, Python,Numpy,Pandas,Matplotlib, Sckitlearn.'
  },
  {
    'question': 'MovieMentor yalnızca Android ve iOS için mi?',
    'answer': 'Hayır, MovieMentor Android, iOS, web ve masaüstü uygulamaları oluşturmak için kullanılabilir. Tüm bu platformlar için iyi bir desteğe sahiptir.'
  }
];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
          leading: BackButton(
          onPressed: () => Navigator.pushReplacementNamed(context, "/profile_page"),
        ),
        ),
      body: Padding(
  padding: const EdgeInsets.all(8.0),
  child: ListView.builder(
    itemCount: questions.length,
    itemBuilder: (context, index) {
      final question = questions[index]['question'];
      final answer = questions[index]['answer'];
      return ExpansionTile(
        title: Text(question!),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(answer!),
          ),
        ],
      );
    },
  )
)
    );
  }
}