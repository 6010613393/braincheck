import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braincheck/Page/Gamepage.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Homepage"),
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Image(
                    image: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/6/64/2048_Screenshot.png")),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                        child: Text("Play Game",style: TextStyle(fontSize: 20.0),),
                        padding: EdgeInsets.only(
                            left: 50.0, top: 20.0, right: 50.0, bottom: 20.0),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Gamepage()));
                        }),
                    SizedBox(
                      height: 200,
                    ),
                  ],
                ),
                Text(
                  "Game designed by",
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Rateepat Prajonthong 6010613393",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
