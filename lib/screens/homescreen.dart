import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreen();
  }

// @override
// State<HomeScreen> createState() => _HomeScreen();

}

class _HomeScreen extends State<HomeScreen> {
  String expression= '';
  String output= '0';
  String _output= '0';
  double num1=0;
  double num2=0;
  String operand ='';

  buttonpreesed(String buttontext){
    if(buttontext=='C'){
      _output='0';
      expression='';
      num1=0;
      num2=0;
      operand='';
    }else
      if(buttontext=='+'||buttontext=="-" || buttontext=="/" || buttontext=='*'){
        num1=double.parse(output);
        expression=num1.toString() + buttontext;
        operand=buttontext;
        _output='0';
      }
      else
        if(buttontext=='='){
          num2=double.parse(output);

          switch(operand){
            case '+':
              _output= (num1+num2).toString();
              break;

              case '-':
              _output= (num1-num2).toString();
              break;

              case '/':
              _output= (num1/num2).toString();
              break;

              case '*':
                _output= (num1*num2).toString();
              break;


          }
          num1=0;
          num2=0;
          operand='';
        }else{
          _output+=buttontext ;
          expression+=buttontext;
        }

        setState(() {
          output=double.parse(_output).toStringAsFixed(0);
        });


  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text("Calculator", style: TextStyle(color: Colors.blue),)
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 2 ,horizontal: 2) ,
            child:  Text(expression,style: const TextStyle(fontSize: 24,color: Colors.white,)),
          ),

          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24 ,horizontal: 12) ,
            child:  Text(output,style: const TextStyle(fontSize: 48,color: Colors.white,)),
          ),

          const Expanded(child: Divider(color: Colors.grey)),

          SingleChildScrollView(
            child:
            Column(
              children: [
                Row(
                  children: [
                    Button('7', Colors.grey[800]!),
                    Button('8', Colors.grey[800]!),
                    Button('9', Colors.grey[800]!),
                    Button('/', Colors.orange),
                  ],
                ) ,
                Row(
                  children: [
                    Button('4', Colors.grey[800]!),
                    Button('5', Colors.grey[800]!),
                    Button('6', Colors.grey[800]!),
                    Button('*', Colors.orange),
                  ],
                ) ,
                Row(
                  children: [
                    Button('1', Colors.grey[800]!),
                    Button('2', Colors.grey[800]!),
                    Button('3', Colors.grey[800]!),
                    Button('-', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    Button('.', Colors.grey[800]!),
                    Button('0', Colors.grey[800]!),
                    Button('C', Colors.grey[800]!),
                    Button('+', Colors.orange),
                  ],

                ),
                Row(
                  children: [
                    Button('=', Colors.green),
                  ],
                )
              ],
            )
          )


        ],

      ),

    );
  }


  Widget Button(String Buttontext, Color ButtonColor) {
    return Expanded(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(24),
                  backgroundColor: ButtonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  )
              ),

              onPressed: () {
                buttonpreesed(Buttontext);
              },

              child: Text(Buttontext, style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white
              ),)),


        )


    );
  }

}


