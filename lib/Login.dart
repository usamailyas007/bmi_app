import 'package:flutter/material.dart';
import 'package:switch_screen/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:switch_screen/main.dart';

class LogInPage extends StatefulWidget{
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  var uname = TextEditingController();
  var uemail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('LogIn Page')),
      ),
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(seconds: 4),
          opacity: 1,
          curve: Curves.elasticIn,
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.purple,
                  radius: 45,
                  child: Icon(
                    size: 60,
                    Icons.account_circle
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: uname,
                  decoration: InputDecoration(
                    label: Text('Username'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)
                    )
                  ),
                ),
                SizedBox(
                  height: 16
                ),
                TextField(
                  controller: uemail,

                  decoration: InputDecoration(
                    label: Text('Password'),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)
                    )
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(onPressed: ()async{
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setBool(MyHomePageState.KEYLOGIN, true);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                }, 
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blueAccent)),
                    child: Text('Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}