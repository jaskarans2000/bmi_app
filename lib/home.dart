import 'package:flutter/material.dart';
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }

}

class HomeState extends State<Home>{
  double _bmi;
  final TextEditingController agecontroller=new TextEditingController();
  final TextEditingController weightcontroller=new TextEditingController();
  final TextEditingController heightcontroller=new TextEditingController();

  get getText{
    if(_bmi<18)
      return "UnderWeight";
    if(_bmi>=18 && _bmi<=25)
      return "Normal";
    if(_bmi>25)
      return "OverWeight";
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: new Container(
alignment: Alignment.topCenter,

        child: new ListView(

          children: <Widget>[
            new Image.asset("images/bmilogo.png",
            width: 100.0,
            height: 100.0,
            alignment: Alignment.topCenter,),
           new Container(
             color: Colors.blueGrey.shade200,
             child: new Column(
               children: <Widget>[
                 new TextField(
                   controller:agecontroller,
                   keyboardType: TextInputType.number,
                   decoration: new InputDecoration(
                       labelText: "Age",
                       hintText: "in years",
                       icon: Icon(Icons.person)
                   ),
                 ),
                 new TextField(
                   controller:heightcontroller,
                   keyboardType: TextInputType.number,
                   decoration: new InputDecoration(
                       labelText: "Height",
                       icon: Icon(Icons.assessment)
                   ),
                 ),
                 new TextField(
                   controller:weightcontroller,
                   keyboardType: TextInputType.number,
                   decoration: new InputDecoration(
                       labelText: "Weight",
                       hintText: "in pounds",
                       icon: Icon(Icons.line_weight)
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),),
                 new RaisedButton(onPressed: calculate,
                     color: Colors.pink,

                     child: new Text("Calculate",style: new TextStyle(color: Colors.white),)
                 ),
               ],
             ),
           ),

    Center(
      child: new Text(

        (heightcontroller.text.isEmpty &&weightcontroller.text.isEmpty && agecontroller.text.isEmpty )?"" :"Your BMI: ${_bmi.toStringAsFixed(1)}",
        style: new TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.w500),
      ),
    ),
            Center(
              child: new Text(
                  (heightcontroller.text.isEmpty &&weightcontroller.text.isEmpty && agecontroller.text.isEmpty )?"" :getText,
              style: new TextStyle(color: Colors.pink,fontSize: 30,fontWeight: FontWeight.w500),),
            )
          ],

        ),
      )
    );
  }

  calculate() {
    setState(() {
      if(heightcontroller.text.isNotEmpty && double.parse(heightcontroller.text)>0){
        if(weightcontroller.text.isNotEmpty && double.parse(weightcontroller.text)>0){
          if(agecontroller.text.isNotEmpty &&  double.parse(agecontroller.text)>0){
            double inches=double.parse(heightcontroller.text)*12;
            double weight=double.parse(weightcontroller.text);
            _bmi=((703*weight)/(inches*inches));

          }
        }
      }
    });


  }
}