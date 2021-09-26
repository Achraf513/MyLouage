import 'package:flutter/material.dart';
import 'package:ce_project/VillageWidget.dart';
double screenHeight;
double screenWidth;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.grey,
        scaffoldBackgroundColor: Colors.grey[50],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'My Louage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = 'Welcome to My Louage, pick your current location.';

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
                    (e) => VillageWidget(e.value,e.key,l_pics,0," ")
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
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    final availableHeight = MediaQuery.of(context).size.height -
    AppBar().preferredSize.height -
    MediaQuery.of(context).padding.top -
    MediaQuery.of(context).padding.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.indigo[200],
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 90,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,10,20,10),
                child: Text(
                  text,
                  style : TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                  )
                ),
              ),
            ),
            Container(
              height: availableHeight-90,
              child: ListView( 
                  children : [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      _buildSignleChildScrollView(northeast,northeast_pics, "Northeast"),
                      _buildSignleChildScrollView(northwest,northwest_pics, "Northwest"),
                      _buildSignleChildScrollView(easternCenter,easternCenter_pics, "Eastern center"),
                      _buildSignleChildScrollView(westernCenter,westernCenter_pics, "Western center"),
                      _buildSignleChildScrollView(southeast,southeast_pics, "Southeast"),
                      _buildSignleChildScrollView(southwest,southwest_pics, "Southwest"),
                  ]
                ),]
              ),
            ),
          ],
        ),
      ),
    );
  }
}


