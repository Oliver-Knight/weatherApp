import 'package:calculator_app/screen/home/home_screen.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

class TestingScreen extends StatefulWidget {
  const TestingScreen({Key? key}) : super(key: key);

  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Center(
          child: InkWell(
            onTap: () {
              setState(() {
                click = !click;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                        offset: click == false
                            ? const Offset(4, 4)
                            : const Offset(10, 10),
                        spreadRadius: 1,
                        blurRadius: click ? 30 : 20,
                        color: Colors.grey.shade500,
                        inset: click),
                    BoxShadow(
                        offset: click == false
                            ? const Offset(-4, -4)
                            : const Offset(-10, -10),
                        spreadRadius: 1,
                        blurRadius: click ? 30 : 20,
                        color: Colors.white,
                        inset: click)
                  ]),
              child: click
                  ? const Icon(
                      Icons.android,
                      color: Colors.grey,
                      size: 100,
                    )
                  : const Icon(
                      Icons.apple,
                      size: 100,
                      color: Colors.grey,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
