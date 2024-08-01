import 'package:flutter/material.dart';

import 'Calculator_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SafeArea(
        top: false
        ,
        child: Container(
          color: Colors.pink,
          child:CalculatorView()
        
            ),
      ));
  }
}