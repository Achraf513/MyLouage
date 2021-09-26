import 'package:ce_project/Louage.dart';
import 'package:ce_project/ReservationScreen.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class DestinationScreen extends StatefulWidget {

  String currentPositiontext;
  String destinationText;
  String pic;
  DestinationScreen(String destinationText,String pic,String currentPositiontext)
  {
    this.currentPositiontext = currentPositiontext;
    this.destinationText = destinationText;
    this.pic = pic;
  }
  @override
  _DestinationScreenState createState() => _DestinationScreenState(currentPositiontext,pic,destinationText);
}

class _DestinationScreenState extends State<DestinationScreen> {
  String currentPositiontext;
  String destinationText;
  String pic;
  List<Louage> availableLouages =[]; 
  _DestinationScreenState(String currentPositiontext,String pic,String destinationText)
  {
    this.currentPositiontext = currentPositiontext;
    this.pic = pic;
    this.destinationText = destinationText;
    this.availableLouages = availableLouages;
  
    var rng = new Random();
    double price = 10.0+rng.nextDouble()*10;
    price=(price*10).roundToDouble()/10;
    for (var i = 0; i < 15+rng.nextInt(15); i++) {
      DateTime newDate = DateTime.now().add(Duration(hours: 1+rng.nextInt(24)));
      DateTime formatedDate = newDate.subtract(Duration(minutes: newDate.minute, seconds: newDate.second, milliseconds: newDate.millisecond, microseconds: newDate.microsecond));
      availableLouages.add(
        Louage(currentPositiontext,
          destinationText,
          formatedDate,
          1+rng.nextInt(8),
          105+rng.nextInt(120),
          price
        )
      );
      availableLouages.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    }
     
  }
  String timeLeftCalculator(DateTime dateTime)
  {
    DateTime test = dateTime.subtract(Duration(hours:DateTime.now().hour,minutes: DateTime.now().minute, seconds: DateTime.now().second, milliseconds: DateTime.now().millisecond, microseconds: DateTime.now().microsecond));
    return test.hour.toString()+"h "+test.minute.toString()+"min";
  }
  Widget louageWidget(Louage louage)
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.indigo[50],
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Stack(
          children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height : 5
              ),
              Text(
                "Louage number : " + louage.serialNumber.toString(),
                style: TextStyle(
                  fontSize: 18
                ),
              ),
              Text(
                "Places left : " + louage.placesLeft.toString(),
                style: TextStyle(
                  fontSize: 18
                ),
              ),
              Text(
                "Price : " + louage.price.toString()+ "dt",
                style: TextStyle(
                  fontSize: 18
                ),
              ),
              Text(
                "Parting at : "+new DateFormat.yMMMd().add_jm().format(louage.dateTime),
                style: TextStyle(
                  fontSize: 18
                ),
              ),
              Text(
                louage.dateTime.day==DateTime.now().day?"( Parting in : "+timeLeftCalculator(louage.dateTime)+" )":"",
                style: TextStyle(
                  color: Colors.red[900],
                  fontSize: 18
                ),
              ),
              
            ],
          ),
          Positioned(
            top: 5,
            right: 5,
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo[300])),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                builder:(_)=>ReservationScreen(louage)));
              }, 
              child: Text(
                "reserve",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          )
        ],),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,250,0,0),
              child: Container(
                height : MediaQuery.of(context).size.height-250,
                child : ListView(
                  children: availableLouages.asMap().entries.map((e) => louageWidget(e.value)).toList(),
                )
              ),
            ),
            Stack(children : [
              Container(
                height : 280,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft : Radius.circular(50),
                    bottomRight : Radius.circular(50)
                  ),
                  boxShadow: [BoxShadow(
                    color: Colors.indigo,
                    offset: Offset(0.0,1.0),
                    blurRadius: 10.0
                    )
                  ]
                  ),
                child: Hero(
                    tag: destinationText+"1",
                    child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft : Radius.circular(50),
                      bottomRight : Radius.circular(50)
                    ),
                      child: Image.asset(
                      pic,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10,AppBar().preferredSize.height-20,10,20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back), 
                    iconSize: 35,
                    color: Colors.white,
                    onPressed: (){
                        Navigator.pop(context);
                  }),
                  Row(children : [
                    IconButton(
                      icon: Icon(Icons.search), 
                      iconSize: 35,
                      color: Colors.white,
                      onPressed: (){
                      }
                    ),
                    IconButton(
                      icon: Icon(Icons.list), 
                      iconSize: 35,
                      color: Colors.white,
                      onPressed: (){
                      }
                    ),
                    ])  
                ],),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        
                        Stack(
                        children: [
                          Text(
                            "Currently in : " +currentPositiontext+"\ndestination : "+destinationText,
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..strokeWidth = 3
                                ..color = Colors.black
                                ..style = PaintingStyle.stroke,
                            ),
                          ),
                          Text(
                            "Currently in : " +currentPositiontext+"\ndestination : "+destinationText,
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()..color = Colors.white,
                            ),
                          ),
                        ],
                      )
                      ],
                    ),
                    SizedBox(
                      height : 95,
                    ),
                    Stack(
                      children: [
                        Text(
                          "Select one of the cars showen below",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..strokeWidth = 3
                              ..color = Colors.black
                              ..style = PaintingStyle.stroke,
                          ),
                        ),
                        Text(
                          "Select one of the cars showen below",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..color = Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ])
          ]
        ),
      ],),
    );
  }
}