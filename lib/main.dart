
import 'dart:async'; //timer
import 'package:expense_tracker/pages/homepage.dart';
import 'package:expense_tracker/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //   // Asynchronous operations, e.g., initializing plugins
//   await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (BuildContext context) => const load(),
        '/HomePage': (BuildContext context) => const HomePage(),
      },
    ),
  );
}

// ignore: camel_case_types
class load extends StatefulWidget {
  const load({super.key});

  @override
  State<load> createState() {
    return _loadState();
  }
}

// ignore: camel_case_types
class _loadState extends State<load> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 8),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 150.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Lottie.network(
                      'https://lottie.host/a8dbb596-e28b-47f7-8f1b-a8aab237958f/mqezQQ3Mbq.json'),
                ),
                Text(
                  ' Expensely',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22 ,
                    fontWeight: FontWeight.bold,

                    //letterSpacing: 8.0,
                    wordSpacing: 7.0,
                    color: Colors.blue,
                  ),
                ),
              SizedBox(
                    height: 3),
                Text(
                  ' Track Your Expenses',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize:  16,
                    fontWeight: FontWeight.normal,

                    //letterSpacing: 8.0,
                    wordSpacing: 7.0,
                    color: Colors.amber,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}


