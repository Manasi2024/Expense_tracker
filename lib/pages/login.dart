import 'package:flutter/material.dart';

import 'homepage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //   // Asynchronous operations, e.g., initializing plugins
//   await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (BuildContext context) => const LoginPage(),
        '/HomePage': (BuildContext context) => const HomePage(),
      },
    ),
  );
}



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  //     ));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.network(
                            'https://static.vecteezy.com/system/resources/thumbnails/002/387/693/small/user-profile-icon-free-vector.jpg',
                            height: 250,
                            width: 200,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              label: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  " USERID :",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue,
                                  ),
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return " User Id is required !! ";
                              } else if (!value.contains('@')) {
                                return "Please Enter Valid Email !!";
                              }
                              return null;
                            },
                            // onSaved: (newValue) {
                            //   _username = newValue!; // Save the value of the username field
                            // },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              label: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  " PASSWORD :",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlue,
                                  ),
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return " Password is required !! ";
                              } else if (!value.contains('_')) {
                                return "Please Enter Valid Password !!";
                              }
                              return null;
                            },
                            // onSaved: (newValue) {
                            //   _password = newValue!; // Save the value of the password field
                            // },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.lightBlue),
                      ),
                      onPressed: () {

                        Navigator.pushReplacementNamed(context, '/HomePage');
                      },
                      child: const Text(
                        '           Login          ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}