import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mental_health_app/SDRS_Page.dart';
import 'package:mental_health_app/question.dart';
import 'package:flutter/material.dart';

import 'Showup.dart';

class BACEPage extends StatefulWidget {
  @override
  _BACEPageState createState() => _BACEPageState();
}

class _BACEPageState extends State<BACEPage> {
  
  SwiperController _controller = SwiperController();
  List<Question> BACE_Questions = [
    Question(), Question(), Question(), Question(), Question(), Question(), Question(), Question(), Question(),
    Question(), Question(), Question(), Question(), Question(), Question(), Question(), Question(), Question(),
    Question(), Question(), Question(), Question(), Question(), Question(), Question(), Question(), Question(),
  ];

  List<String> questions = ["Being unsure where to go to get  professional care","Wanting to solve the problem on my own",
  "Concern that I might be seen as weak for having a mental health problem","Fear of being put in hospital against my will",
  "Concern that it might harm my chances when applying for jobs","Problems with transport or travelling to appointments",
  "Thinking the problem would get better by itself","Concern about what my family might think, say, do or feel",
  "Feeing embarrassed or ashamed","Preferring to get alternative forms of care (e.g. traditional / religious healing or alternative / complementary therapies)",
  "Not being able to afford the financial costs involved","Concern that I might be seen as ‘crazy’",
  "Thinking that professional care probably would not help","Professionals from my own ethnic or cultural group not being available",
  "Being too unwell to ask for help","Concern that people I know might find out","Dislike of talking about my feelings, emotions or thoughts",
  "Concern that people might not take me seriously if they found out I was having professional care",
  "Concerns about the treatments available (e.g. medication side effects)","Not wanting a mental health problem to be on my medical records",
  "Having had previous bad experiences with professional care for mental health","Preferring to get help from family or friends",
  "Thinking I did not have a problem","Concern about what my friends might think, say or do","Difficulty taking time off work",
  "Concern about what people at work might think, say or do","Having no one who could help me get professional care"];
  

  List<int> qType = [2,4,7,8,11,15,17,19,23,25];
  List<Color> randomizecolor = [Colors.blue,Colors.green,Colors.red,Colors.purple,Colors.pink,Colors.orange];
  int total_a =0,total_d =0,total_s =0;
  String result_a,result_d,result_s;

  int total =0,critical_total =0 ;

  _getQuestions() {
    for(int i =0;i<27;i++){
      BACE_Questions[i].getQues(questions[i], 'assets/bace-DrManik_${(i+1)}.png');
      BACE_Questions[i].getOptions("Not at all", "A little", "Quite a lot", "A lot");
      BACE_Questions[i].getColor(randomizecolor[i%6], randomizecolor[i%6], randomizecolor[i%6], randomizecolor[i%6]);
      BACE_Questions[i].type = 1;
    }
    qType.forEach((index){
      BACE_Questions[index].type = 2;
    });
  }



  @override
  void initState() {
    super.initState();
    _getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Swiper(
          itemCount: 28,
        curve: Curves.easeInOutCubic,
        scrollDirection:Axis.vertical,
        loop: false,
        viewportFraction: 0.95,
        scale: 0.5,
        controller: _controller,
        itemBuilder: (BuildContext context, int index){
          if(index<27){
            return page(BACE_Questions[index], index);
          }
          else if(index ==27) return summary();
          else return null;
        },
      ),
    );
  }

  Widget page(Question question,int index) {
    return Center(
      child: SizedBox(
        //height: 800,
        child: Column(
          children: <Widget>[
            ShowUp(
              delay: 500,
                          child: Container(
                  child: Image(
                    image: AssetImage(question.imgURL),
                    height: 250,
                  )),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                question.ques,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                _controller.next();
                if(BACE_Questions[index].type == 1){total +=0;}
                else {total += 0; critical_total += 0;}
                setState(() {
                  BACE_Questions[index].answer = question.opt1;
                  BACE_Questions[index].points = 0;
                });
              },
              child: Card(
                elevation: 8,
                color: question.opt1Color,
                child: ListTile(
                  leading:
                  Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  title: Text(
                    question.opt1,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _controller.next();
                if(BACE_Questions[index].type == 1){total +=1;}
                else {total += 1; critical_total += 1;}
                setState(() {
                  BACE_Questions[index].answer = question.opt2;
                  BACE_Questions[index].points = 1;
                });
              },
              child: Card(
                elevation: 8,
                color: question.opt2Color,
                child: ListTile(
                  leading:
                  Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  title: Text(
                    question.opt2,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _controller.next();
                if(BACE_Questions[index].type == 1){total +=2;}
                else {total += 2; critical_total += 2;}
                setState(() {
                  BACE_Questions[index].answer = question.opt3;
                  BACE_Questions[index].points = 2;
                });
              },
              child: Card(
                elevation: 8,
                color: question.opt3Color,
                child: ListTile(
                  leading:
                  Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  title: Text(
                    question.opt3,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _controller.next();
                if(BACE_Questions[index].type == 1){total += 3;}
                else {total += 3; critical_total += 3;}
                setState(() {
                  BACE_Questions[index].answer = question.opt4;
                  BACE_Questions[index].points = 3;
                });
              },
              child: Card(
                elevation: 8,
                color: question.opt4Color,
                child: ListTile(
                  leading:
                  Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  title: Text(
                    question.opt4,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget summary(){
    return Center(
      child: Container(
        color: Colors.white,
        child: Padding(padding: EdgeInsets.only(top: 300),
          child: Column(
            children: <Widget>[
              Text("Result",style: TextStyle(fontSize: 30)),
              Text("Total = " + total.toString(),style: TextStyle(fontSize: 20),),
              Text("Critical Question Total = " + critical_total.toString(),style: TextStyle(fontSize: 20)),
              RaisedButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SDRSPage()));
              },
                color: Colors.teal,
                child: Text("Next",style: TextStyle(fontSize: 20,color: Colors.white),),)
            ],
          ),
        ),
      ),
    );
  }


}
