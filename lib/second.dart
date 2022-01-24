// in order to reduce code we can write simple code and then  re use it
// like give below.

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firstnum;
  int secondnum;
  String texttodisplay = "";
  String result;
  String operatorr;
  void btnclicked(String btnval) {
    if (btnval == 'C') {
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      result = "";
      operatorr = "";
    } else if (btnval == '+' ||
        btnval == '-' ||
        btnval == '/' ||
        btnval == '*') {
      firstnum = int.parse(texttodisplay);
      result = "";
      operatorr = btnval;
    } else if (btnval == '=') {
      secondnum = int.parse(texttodisplay);
      if (operatorr == '+') {
        result = (firstnum + secondnum).toString();
      }
      if (operatorr == '-') {
        result = (firstnum - secondnum).toString();
      }
      if (operatorr == '*') {
        result = (firstnum * secondnum).toString();
      }
      if (operatorr == '/') {
        result = (firstnum / secondnum).toString();
      } else {
        result = int.parse(texttodisplay + btnval).toString();
      }

      setState(() {
        texttodisplay = result;
      });
    }
  }

  Widget custombutton(String btnvalue) {
    return Expanded(
        child: OutlineButton(
      padding: EdgeInsets.all(25.0),
      onPressed: () => btnclicked(btnvalue),
      child: Text(
        '$btnvalue',
        style: TextStyle(fontSize: 25.0),
      ),
      // so now we can remove the expanded widget from below. and we can
      // write this
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Calculator',
            style: TextStyle(fontFamily: 'cursive', fontSize: 35.0),
          ),
          backgroundColor: Color(0XFFC5AE6D),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // this will move buttons to the below end.
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "$texttodisplay",
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0XFF000000),
                      backgroundColor: Colors.black,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  // Expanded(
                  //   // expanded is use to that it will take the whole width
                  //   // of anything that are given to that. like here we give
                  //   // material button.
                  //   child: MaterialButton(
                  //     onPressed: () {},
                  //     child: Text('1'),
                  //   ),
                  // ),
                  // Expanded(
                  //   child: MaterialButton(
                  //     onPressed: () {},
                  //     child: Text('2'),
                  //   ),
                  // ),

                  custombutton('9'),
                  custombutton('8'),
                  custombutton('7'),
                  custombutton('+'),
                ],
              ),
              Row(
                children: [
                  custombutton('6'),
                  custombutton('5'),
                  custombutton('4'),
                  custombutton('-'),
                ],
              ),
              Row(
                children: [
                  custombutton('3'),
                  custombutton('2'),
                  custombutton('1'),
                  custombutton('*'),
                ],
              ),
              Row(
                children: [
                  custombutton('C'),
                  custombutton('0'),
                  custombutton('='),
                  custombutton('/'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
