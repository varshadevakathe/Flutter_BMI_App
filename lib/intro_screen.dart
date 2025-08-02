import 'package:flutter/material.dart';
import 'package:classico/main.dart';

class IntroPage extends StatelessWidget{
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATION', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('WELCOME!!',
              style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic
              ),
            ),
            SizedBox(height: 21),
            Container(
              width: 300,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  label: Text('Enter Your Name'),
                  prefixIcon: Icon(Icons.contacts_outlined)
                ),
              ),
            ),
            SizedBox(height: 21),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyHomePage(nameController.text.toString());
              })
              );
            }, child: Text('Next', style: TextStyle(color: Colors.black87)),)
          ],
        ),
      ),
    );
  }
}
