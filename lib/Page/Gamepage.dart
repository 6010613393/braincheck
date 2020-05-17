import 'package:flutter/material.dart';
import 'dart:math';

class Gamepage extends StatefulWidget {
  @override
  _GamepageState createState() => _GamepageState();
}

Random random = new Random();

class _GamepageState extends State<Gamepage> {
  var count = 1;
  bool pressed = true;
  var result = '<< ผลลัพธ์ >>';

  List<List<String>> matrix = [
    ['', '', '', ''],
    ['', '', '', ''],
    ['', '', '', ''],
    ['', '', '', '']
  ];

  List<List<String>> matrix32 = [
    ['', '', '', ''],
    ['', '', '', ''],
    ['', '', '', ''],
    ['', '', '', '']
  ];

  List<List<String>> initmatrix = [
    ['', '', '', ''],
    ['', '', '', ''],
    ['', '', '', ''],
    ['', '', '', '']
  ];

  _GamepageState() {
    _randomMatrix();
    _randomMatrix32();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("1-32             "),
        ),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildElement(0, 0),
                  _buildElement(0, 1),
                  _buildElement(0, 2),
                  _buildElement(0, 3),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildElement(1, 0),
                  _buildElement(1, 1),
                  _buildElement(1, 2),
                  _buildElement(1, 3),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildElement(2, 0),
                  _buildElement(2, 1),
                  _buildElement(2, 2),
                  _buildElement(2, 3),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildElement(3, 0),
                  _buildElement(3, 1),
                  _buildElement(3, 2),
                  _buildElement(3, 3),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(result),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RaisedButton(
                      child: Text('Back to Menu'),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    width: 20,
                  ),
                  RaisedButton(
                    child: Text('Restart Game'),
                    onPressed: () {
                      setState(() {
                        _randomMatrix();
                        _randomMatrix32();
                        count = 1;
                        result = '<< ผลลัพธ์ >>';
                      });
                    },
                  ),
                ],
              ),
            ],
          )),
    );
  }

  _buildElement(int i, int j) {
    return GestureDetector(
      onTap: () {
        _afterClicked(i, j, count);
        if (count == 33) {
          result = "Completed to check 1 to 32!";
        }
      },
      child: Container(
        width: 70.0,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.black)),
        child: Center(
            child: Text(
                matrix[i][j],
                style: count<=17
                ? TextStyle(fontSize: 60.0, color: Colors.black54)
                : TextStyle(fontSize: 60.0, color: Colors.red),
      ),
    ),)
    );
  }

  _randomMatrix() {
    List list = List.generate(16, (i) => i + 1);
    list.shuffle();
    List<List<String>> r1 = [
      [
        list[0].toString(),
        list[1].toString(),
        list[2].toString(),
        list[3].toString()
      ],
      [
        list[4].toString(),
        list[5].toString(),
        list[6].toString(),
        list[7].toString()
      ],
      [
        list[8].toString(),
        list[9].toString(),
        list[10].toString(),
        list[11].toString()
      ],
      [
        list[12].toString(),
        list[13].toString(),
        list[14].toString(),
        list[15].toString()
      ]
    ];
    for (var x = 0; x < matrix.length; x++) {
      for (var y = 0; y < matrix[x].length; y++) {
        matrix[x][y] = r1[x][y];
      }
    }
  }

  _randomMatrix32() {
    List list32 = List.generate(16, (i) => i + 17);
    list32.shuffle();
    List<List<String>> r1 = [
      [
        list32[0].toString(),
        list32[1].toString(),
        list32[2].toString(),
        list32[3].toString()
      ],
      [
        list32[4].toString(),
        list32[5].toString(),
        list32[6].toString(),
        list32[7].toString()
      ],
      [
        list32[8].toString(),
        list32[9].toString(),
        list32[10].toString(),
        list32[11].toString()
      ],
      [
        list32[12].toString(),
        list32[13].toString(),
        list32[14].toString(),
        list32[15].toString()
      ]
    ];
    for (var x = 0; x < matrix32.length; x++) {
      for (var y = 0; y < matrix32[x].length; y++) {
        matrix32[x][y] = r1[x][y];
      }
    }
  }

  _afterClicked(int i, int j, int k) {
    setState(() {
      if (matrix[i][j].compareTo(k.toString()) == 0) {
        matrix[i][j] = matrix32[i][j];
        count++;
      } else if (matrix[i][j].compareTo(k.toString()) == 0) {
        matrix[i][j] = initmatrix[i][j];
        count++;
      }
    });
  }
}
