import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget{
  late String title;
  //constructor
  MyHomePage({required this.title});
  //controller
  TextEditingController phoneTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call In Example"),
      ),
      body: Column(
        children: [
          TextField(
            controller: phoneTextEditingController,
            decoration: InputDecoration(
              hintText: "Phone Number"
            )
          ),
          ElevatedButton(
              onPressed: (){
                var phoneNumber = phoneTextEditingController.text;
                phoneCall(phoneNumber);
              },
              child: Text("call")
          )
        ],
      ),
    );
  }

  void phoneCall(String phoneNumber) async{
    String url = "tel: ${(phoneNumber)}";
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      print("Something went wrong");
    }
  }
}
