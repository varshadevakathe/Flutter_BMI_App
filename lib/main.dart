import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: const MyHomePage(title: 'Flutter Demo App')
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  var result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Flutter'),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: controller1, keyboardType: TextInputType.number),
              TextField(controller: controller2, keyboardType: TextInputType.number),
              Padding(
                padding: const EdgeInsets.all(21.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){
                      setState(() {
                        var no1 = int.parse(controller1.text.toString());
                        var no2 = int.parse(controller2.text.toString());
                        var sum = no1 + no2;
                        result = '$sum';
                      });
                    }, child: Text('Add')),

                    ElevatedButton(onPressed: (){
                      setState(() {
                        var no1 = int.parse(controller1.text.toString());
                        var no2 = int.parse(controller2.text.toString());
                        var diff = no1 - no2;
                        result = '$diff';
                      });
                    }, child: Text('Sub')),

                    ElevatedButton(onPressed: (){
                      setState(() {
                        var no1 = int.parse(controller1.text.toString());
                        var no2 = int.parse(controller2.text.toString());
                        var prod = no1 * no2;
                        result = '$prod';
                      });
                    }, child: Text('Multi')),

                    ElevatedButton(onPressed: (){
                      setState(() {
                        var no1 = int.parse(controller1.text.toString());
                        var no2 = int.parse(controller2.text.toString());
                        var div = no1 / no2;
                        result = '${div.toStringAsFixed(2)}.';
                      });
                    }, child: Text('Div')),
                  ],
                ),
              ),
              Text('Result: $result', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.indigo),)
            ],
          ),
        ),
      )
    );
  }
}