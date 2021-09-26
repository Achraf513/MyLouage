import 'package:ce_project/CurrentLocationScreen.dart';
import 'package:ce_project/DestinationScreen.dart';
import 'package:flutter/material.dart';

class VillageWidget extends StatefulWidget {
  String selectedPositionText;
  String currentPositionText;
  int index; 
  List<String> l_pics;
  int mode;
  
  VillageWidget(String selectedPositionText, int index,List<String> l_pics,int mode,String currentPositionText)
  {
    this.selectedPositionText = selectedPositionText;
    this.currentPositionText = currentPositionText;
    this.index = index;
    this.l_pics = l_pics;
    this.mode = mode;
  }
  @override
  _VillageWidgetState createState() => _VillageWidgetState(selectedPositionText, index,l_pics,mode, currentPositionText);
}
class _VillageWidgetState extends State<VillageWidget> {
  String selectedPositionText;
  String currentPositionText;
  int index;
  List<String> l_pics;
  int mode;

  _VillageWidgetState(String selectedPositionText, int index,List<String> l_pics,int mode,String currentPositionText)
  {
    this.selectedPositionText = selectedPositionText;
    this.currentPositionText = currentPositionText;
    this.index = index;
    this.l_pics = l_pics;
    this.mode = mode;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(mode == 0)
        {
          Navigator.push(context, MaterialPageRoute(
          builder:(_)=>CurrentLocationScreen(selectedPositionText, l_pics[index])
          ));
        }else
        {
          Navigator.push(context, MaterialPageRoute(
          builder:(_)=>DestinationScreen(selectedPositionText, l_pics[index],currentPositionText)
          )
        );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.indigo[100],
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height : 5
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width : 5
                      ),
                      Container(
                        child: FittedBox(
                          child: Hero(
                              tag: selectedPositionText+mode.toString(),
                              child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(l_pics[index],
                              fit: BoxFit.cover,
                              height: 160,
                              width: 160,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width : 5
                      )
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      SizedBox(
                        width : 10
                      ),
                      Text(
                        selectedPositionText,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ), 
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}