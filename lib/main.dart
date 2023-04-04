

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }

}
class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var KgController = TextEditingController();

  var FtController = TextEditingController();

  var InController = TextEditingController();

  var result = "";

  var bgColor = Colors.blue.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI APP',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            height: 600,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.purple.shade500),),
                SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: KgController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21)
                    ),
                    label: Text('Enter your Weight(in kgs)'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: FtController,
                  decoration: InputDecoration(
                      label: Text('Enter your Height(in Feet'),
                      prefixIcon: Icon(Icons.height),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21)
                      )
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: InController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21)
                      ),
                      label: Text('Enter your Height(in Inch)'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 46,
                ),
                Container(
                  width: 120,
                  height: 40,
                  child: ElevatedButton(onPressed: (){
                    var ikg = int.parse(KgController.text.toString()) ;
                    var ift = int.parse(FtController.text.toString());
                    var inch = int.parse(InController.text.toString());

                    if(ikg!= "" && ift!= "" && inch!= ""){
                      var tinch = (ift*12) + inch;
                      var tCm = tinch*2.54;
                      var tM = tCm/100;
                      var bmi = ikg/(tM*tM);
                      var msg = "";
                      if(bmi>25){
                        msg = "You are Overweight!!";
                        bgColor = Colors.purple.shade300;
                      }else if (bmi<18){
                        msg = "You are UnderWeight";
                        bgColor = Colors.yellowAccent.shade200;
                      }else{
                        msg = "You are healthy";
                        bgColor = Colors.green.shade300;
                      }
                      setState(() {
                        result = "$msg \n\n Your BMI is: ${bmi.toStringAsFixed(2)}";
                      });
                    }
                    else{
                      setState(() {
                        result = "Please Fill all required blanks!!";
                      });
                    }

                  },style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)))), child: Text('Calculate',style: TextStyle(fontWeight: FontWeight.bold),),),
                ),
                SizedBox(
                  height: 11,
                ),
                Text(result,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
