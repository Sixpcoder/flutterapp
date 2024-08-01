import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {

  int x= 0;
  int y= 0;
  num z= 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();


  //
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();
     _listener = AppLifecycleListener(
       // onShow: _onshow,

     );
  }

  @override
  void dispose() {
    displayOneController.dispose();
    displayTwoController.dispose();
    _listener.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [

           CalculatorDisplay(hintText:"Enter first number",controller :displayOneController),
          const SizedBox(height: 30,),
           CalculatorDisplay(hintText: "Enter second number",controller: displayTwoController,),
          const SizedBox(
            height: 30,
          ),
          Text(

            z.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold
          ),
          ),
          const Spacer(),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CalculatorButton(icon: Icons.add,
                  onPressed : () {
                setState(() {
                  z= num.tryParse(displayOneController.text)! +
                      num.tryParse(displayTwoController.text)!;
                });

              }),
              CalculatorButton(icon: Icons.remove, onPressed: (){
                setState(() {
                  z= num.tryParse(displayOneController.text)! -
                      num.tryParse(displayTwoController.text)!;
                });
              },),
              CalculatorButton(icon: Icons.close, onPressed: (){
                setState(() {
                  z= num.tryParse(displayOneController.text)! *
                      num.tryParse(displayTwoController.text)!;
                });
              },),
              CalculatorButton(icon: Icons.percent,onPressed: (){
                setState(() {
                  z= num.tryParse(displayOneController.text)! /
                      num.tryParse(displayTwoController.text)!;
                });
              },),

            ],
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton.extended(
            onPressed: (){
              setState(() {
                x = 0;
                y =0;
                z=0;
                displayTwoController.clear();
                displayOneController.clear();
              });

          },
          label: const Text("Clear"),
          )
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const CalculatorButton({
    super.key, required this.icon,required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(icon),
      onPressed: onPressed,
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  final hintText;
  final TextEditingController controller;

  const CalculatorDisplay({
    super.key, this.hintText, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,

      decoration: InputDecoration(

        focusedBorder: OutlineInputBorder(

          borderSide: const BorderSide(
            color: Colors.white,
            width: 3.0

          ),
          borderRadius: BorderRadius.circular(10)
        ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white
            ),
          ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white
        ),

      ),

    );
  }
}
