import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double result = 0.0;
  double num1 = 0.0;
  double num2 = 0.0;
  String calIcon = '+';
  String calIcondown = '+';
  double resultFuncation() {
    switch (calIcon) {
      case '+':
        setState(() {
          result = num1 + num2;
        });
        break;
      case '-':
        setState(() {
          result = num1 - num2;
        });
        break;
      case '/':
        setState(() {
          result = num1 / num2;
        });
        break;
      case 'x':
        setState(() {
          result = num1 * num2;
        });
        break;
      default:
        setState(() {
          result = num1 + num2;
        });
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.amber,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    // color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage('assets/img/calculator.png'),
                        fit: BoxFit.contain)),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Choose type of calculation operation',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: textField(
                        title: 'Num 1',
                        function: (value) {
                          num1 = double.parse(value);
                          print('Num 1 : $num1');
                        }),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                        child: Text(
                      calIcon,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    )),
                  ),
                  Expanded(
                    flex: 2,
                    child: textField(
                        title: 'Num 2',
                        function: (value) {
                          num2 = double.parse(value);
                          print('Num 2 : $num2');
                        }),
                  )
                ],
              ),
              SizedBox(height: 15),
              SizedBox(height: 10),
              calTypeRow(),
              SizedBox(height: 20),
              line(),
              resultButton(),
              Text(
                'Result : ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.red),
              ),
              SizedBox(width: 10),
              Text(
                ' $num1 $calIcondown $num2 = $result',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.blue),
              )
            ],
          ),
        ),
      ),
    );
  }

  Divider line() {
    return Divider(
      color: Colors.grey,
      height: 1.5,
      thickness: 1.5,
      indent: 70,
      endIndent: 70,
    );
  }

  Row calTypeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        calTypeButton(
            icon: '+',
            function: () {
              setState(() {
                calIcon = '+';
              });
            },
            color: Colors.green),
        calTypeButton(
            icon: '-',
            function: () {
              setState(() {
                calIcon = '-';
              });
            },
            color: Colors.amber),
        calTypeButton(
            icon: 'x',
            function: () {
              setState(() {
                calIcon = 'x';
              });
            },
            color: Colors.blue),
        calTypeButton(
            icon: '/',
            function: () {
              setState(() {
                calIcon = '/';
              });
            },
            color: Colors.blueGrey),
      ],
    );
  }

  FloatingActionButton calTypeButton(
      {@required String icon, @required Function function, Color color}) {
    return FloatingActionButton(
      elevation: 0,
      mini: true,
      backgroundColor: color,
      child: Center(
        child: Text(
          icon,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      onPressed: function,
    );
  }

  Padding resultButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: RaisedButton(
        child: Text(
          '=',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
        color: Colors.amber,
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        onPressed: () {
          resultFuncation();
          setState(() {
            calIcondown = calIcon;
          });
          print('result : $result');
        },
      ),
    );
  }

  Widget textField({@required String title, @required Function function}) {
    return TextField(
      onChanged: function,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        hintText: title,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
