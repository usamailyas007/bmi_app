import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:switch_screen/main.dart';
import 'package:switch_screen/Login.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home')),
      ),
      body: Stack(

        children: [ Container(
        color: Colors.purple.shade100,
        child: Center(child: Icon(Icons.home,size: 130,color: Colors.purple.withOpacity(0.5),)),
        ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(bottom: 50),
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(onPressed: ()async{
                var prefs = await SharedPreferences.getInstance();

                prefs.setBool(MyHomePageState.KEYLOGIN, false);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogInPage(),));
              }, child: Text('Logout'),  ),
            ),
          )]
      ),
    );
  }
  
}