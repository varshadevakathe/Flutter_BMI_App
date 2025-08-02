import 'package:flutter/material.dart';
import 'package:classico/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: SplashScreen()
    );
  }
}

class MyHomePage extends StatefulWidget{
  var namefromintro;
  MyHomePage(this.namefromintro);

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = '';
  var msgcolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('BMI CALCULATOR', style: TextStyle(color: Colors.white),),
      ),

      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hey ${widget.namefromintro}!!',
                style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 11),
              Text('Here You Can Calculate Your BMI!!', style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 11
              ),),
              SizedBox(height: 11),
              TextField(controller: wtController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Enter your Weight in kg'),
                  prefixIcon: Icon(Icons.line_weight)
                ),
              ),
              SizedBox(height: 11),
              TextField(controller: ftController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Enter your Height in feet'),
                  prefixIcon: Icon(Icons.height)
                ),
              ),
              SizedBox(height: 11),
              TextField(controller: inController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Enter your Height in inch'),
                  prefixIcon: Icon(Icons.height)
                ),
              ),
              SizedBox(height: 11),
              ElevatedButton(onPressed: (){
                var wt = wtController.text.toString();
                var ft = ftController.text.toString();
                var inc = inController.text.toString();
                if(wt!='' && ft!=''&& inc!=''){
                  var Wt = int.parse(wt);
                  var Ft = int.parse(ft);
                  var Inc = int.parse(inc);
                  var tInc = (Ft*12) + Inc;
                  var tCm = tInc * 2.54;
                  var tM = tCm/100;
                  var bmi = Wt/(tM*tM);
                  var msg;
                  if (bmi>25){
                    msg = 'Your Overweight!!';
                    msgcolor = Colors.red;
                  }
                  else if (bmi<18){
                    msg = 'Your Underweight!!';
                    msgcolor = Colors.orange;
                  }
                  else{
                    msg = 'Your Healthy!!';
                    msgcolor = Colors.green;
                  }
                  setState(() {
                    result = '$msg \n Your BMI is ${bmi.toStringAsFixed(4)}';
                  });
                } else{
                  setState(() {
                    result = 'Please fill all the required blanks!!';
                    msgcolor = Colors.black87;
                  });
                }
              }, child: Text(
                'Calculate', style: TextStyle(color: Colors.black87),
                )
              ),
              SizedBox(height: 11),
              Text(result, textAlign: TextAlign.center,
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15, color: msgcolor),),
            ],
          ),
        ),
      )
    );
  }
}