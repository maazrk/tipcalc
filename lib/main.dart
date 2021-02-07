import 'package:flutter/material.dart';
import 'package:tipcalc/ui/screens/calculate_tip_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      theme: ThemeData(
          // Primary color used in our app
          primaryColor: const Color(0xff455A64),

          // The accent color is used more subtly throughout the app, to call attention to key elements
          accentColor: const Color(0xff263238),

          // Define the default font family.
          // fontFamily: 'Rowdies',

          // Define the default TextTheme. Use this to specify the default
          textTheme: const TextTheme(
            headline4: TextStyle(fontSize: 18),
          ).apply(
            displayColor: Colors.white,
          ),

          // Theme for our input text boxes
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: const Color(0xff455A64),

              // This defines how the unfocused border of a text box should look
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.0),
                  borderSide: const BorderSide(color: Colors.white, width: 2)),

              // This defines how the focused border of a text box should look
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.0),
                  borderSide:
                      const BorderSide(color: Colors.white, width: 2)))),
      home: CalculateTipScreen(),
    );
  }
}
