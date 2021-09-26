import 'package:ce_project/Louage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReservationScreen extends StatefulWidget {
  Louage selectedLouage;
  ReservationScreen(Louage selectedLouage) {
    this.selectedLouage = selectedLouage;
  }
  @override
  _ReservationScreenState createState() =>
      _ReservationScreenState(selectedLouage);
}

class _ReservationScreenState extends State<ReservationScreen> {
  Louage selectedLouage;
  _ReservationScreenState(Louage selectedLouage) {
    this.selectedLouage = selectedLouage;
  }
  String timeLeftCalculator(DateTime dateTime) {
    DateTime test = dateTime.subtract(Duration(
        hours: DateTime.now().hour,
        minutes: DateTime.now().minute,
        seconds: DateTime.now().second,
        milliseconds: DateTime.now().millisecond,
        microseconds: DateTime.now().microsecond));
    return test.hour.toString() + "h " + test.minute.toString() + "min";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[200],
        centerTitle: true,
        title: Text("Payment page"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.indigo[100],
              child: Column(
                children: [
                  SizedBox(
                    height: 35,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selected informations :",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Currently in : " + selectedLouage.currentPosition,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Destination : " + selectedLouage.destination,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Louage number : " +
                            selectedLouage.serialNumber.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Places left : " + selectedLouage.placesLeft.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Price : " + selectedLouage.price.toString() + "dt",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Parting at : " +
                            new DateFormat.yMMMd()
                                .add_jm()
                                .format(selectedLouage.dateTime),
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        selectedLouage.dateTime.day == DateTime.now().day
                            ? "( Parting in : " +
                                timeLeftCalculator(selectedLouage.dateTime) +
                                " )"
                            : "",
                        style: TextStyle(color: Colors.red[900], fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 15)
                ],
              ),
            ),
            SizedBox(
              height: 15,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              width: 320,
              child: TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
                keyboardType: TextInputType.name,
                inputFormatters: [],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  labelStyle: TextStyle(fontSize: 15),
                  hintStyle: TextStyle(fontSize: 15),
                  hintText: 'Name',
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 320,
              child: TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  labelStyle: TextStyle(fontSize: 15),
                  hintStyle: TextStyle(fontSize: 15),
                  hintText: 'Family name',
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 320,
              child: TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
                keyboardType: TextInputType.number,
                inputFormatters: [],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  labelStyle: TextStyle(fontSize: 15),
                  hintStyle: TextStyle(fontSize: 15),
                  hintText: 'e-Dinar card number (Last 6 digits)',
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 320,
              child: TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
                keyboardType: TextInputType.number,
                inputFormatters: [],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  labelStyle: TextStyle(fontSize: 15),
                  hintStyle: TextStyle(fontSize: 15),
                  hintText: 'Confidential code',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "Pay",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              color: Colors.indigo[300],
            )
          ],
        ),
      ),
    );
  }
}
