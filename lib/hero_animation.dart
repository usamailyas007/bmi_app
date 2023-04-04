import 'package:flutter/material.dart';

class HeroPic extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: Hero(tag: 'teady',
          child: Image.asset('assets/images/toy.png')),
    );

  }

}