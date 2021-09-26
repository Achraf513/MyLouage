import 'package:ce_project/Louage.dart';
import 'package:flutter/material.dart';

import 'VillageWidget.dart';

class CurrentLocationScreen extends StatefulWidget {
  String currentPositiontext;
  String pic;
  CurrentLocationScreen(String currentPositiontext,String pic)
  {
    this.currentPositiontext = currentPositiontext;
    this.pic = pic;
}
  @override
  _CurrentLocationScreenState createState() => _CurrentLocationScreenState(currentPositiontext,pic);
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  String currentPositiontext;
  String pic;
  List <String> northeast = ["Tunis", "Zaghouan", "Nabeul"];
  List <String> northeast_pics = ["assets/pics/tunis.jpg", "assets/pics/Zaghouan.jpg", "assets/pics/Nabeul.jpg"]; 

  List <String> northwest = ["Beja", "El Kef"];
  List <String> northwest_pics =["assets/pics/Beja.jpg", "assets/pics/el_kef.jpg"];

  List <String> easternCenter = ["Sousse", "Monastir", "Mahdia", "Sfax"];
  List <String> easternCenter_pics = ["assets/pics/sousse.jpg", "assets/pics/monastir.png",
  "assets/pics/mahdia.jpg", "assets/pics/sfax.jpg"];

  List <String> westernCenter = ["Kairouan", "Kasserine", "Sidi Bouzid"];
  List <String> westernCenter_pics = ["assets/pics/kairouan.jpg", "assets/pics/kasserine.jpg", 
  "assets/pics/Sidi_bouzid.jpg"];

  List <String> southeast = ["Gabes", "Medenine", "Tataouine"];
  List <String> southeast_pics = ["assets/pics/gabes.jpg", "assets/pics/medenine.jpg", 
  "assets/pics/Tataouine.jpg"];

  List <String> southwest = ["Gafsa", "Tozeur", "Kebili"];
  List <String> southwest_pics = ["assets/pics/gafsa.jpg", "assets/pics/Tozeur.jpg", "assets/pics/Kebili.jpg"];
  _CurrentLocationScreenState(String text,String pic)
  {
    this.currentPositiontext = text;
    this.pic = pic;
  }
  Widget _buildSignleChildScrollView(List<String> l, List<String> l_pics,String title)
  {
    return 
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Container(
            color: Colors.indigo[50],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height : 10
                ),
                Row(
                  children: [
                    SizedBox(
                      width:10
                    ),
                    Text(title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                Row(children: 
                  l
                  .asMap()
                  .entries
                  .map(
                    (e) {
                      if(e.value!=currentPositiontext)
                      return VillageWidget(e.value,e.key,l_pics,1,currentPositiontext);
                      else return SizedBox(width: 0,);
                    }
                  ).toList()
                ,),
              ],
            ),
          ),
          SizedBox(
              height : 15
          )
        ],
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
                  children:[ 
                    _buildSignleChildScrollView(northeast,northeast_pics, "Northeast"),
                    _buildSignleChildScrollView(northwest,northwest_pics, "Northwest"),
                    _buildSignleChildScrollView(easternCenter,easternCenter_pics, "Eastern center"),
                    _buildSignleChildScrollView(westernCenter,westernCenter_pics, "Western center"),
                    _buildSignleChildScrollView(southeast,southeast_pics, "Southeast"),
                    _buildSignleChildScrollView(southwest,southwest_pics, "Southwest"),
                  ]
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
                    tag: currentPositiontext+"0",
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
                    Stack(
                      children: [
                        Text(
                          "your current location is :",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..strokeWidth = 3
                              ..color = Colors.black
                              ..style = PaintingStyle.stroke,
                          ),
                        ),
                        Text(
                          "your current location is :",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..color = Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width : 15,
                                height : 15,
                                color : Colors.black,
                              ),
                              Icon(
                                Icons.location_on,
                                color: Colors.black,
                                size: 35,
                              ),
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 30,
                              ),
                            ]
                          ),
                        ),
                        Stack(
                        children: [
                          Text(
                            currentPositiontext,
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..strokeWidth = 3
                                ..color = Colors.black
                                ..style = PaintingStyle.stroke,
                            ),
                          ),
                          Text(
                            currentPositiontext,
                            style: TextStyle(
                              fontSize: 40,
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
                          " Please select your destination",
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
                          " Please select your destination",
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