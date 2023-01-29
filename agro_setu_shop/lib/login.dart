import 'package:agro_setu_shop/Consumer/home.dart' as consumer;
import 'package:agro_setu_shop/Consumer/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:agro_setu_shop/Farmer/Farmer_home.dart' as farmer;
import 'package:agro_setu_shop/Farmer/farmer_signup.dart' as fsignup;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Agro Setu';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? userType;

  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No User found for this email");
      }
      else {
        print("Error Occured");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    // TextEditingController nameController = TextEditingController();
    // TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Welcome!',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Column(
                    children: [
                      RadioListTile(
                        title: Text("Farmer"),
                        value: "farmer",
                        groupValue: userType,
                        onChanged: (value){
                          setState(() {
                            userType = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Consumer"),
                        value: "consumer",
                        groupValue: userType,
                        onChanged: (value){
                          setState(() {
                            userType = value.toString();
                          });
                        },
                      ),
                    ],
                  ),
                )
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text(
                  'Forgot Password?',
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () async {
                      User? user = await loginUsingEmailPassword(email: nameController.text, password: passwordController.text, context: context);
                      print(user);
                      if (user != null) {
                        if (userType == 'farmer')
                          Navigator.push(context, MaterialPageRoute(builder: (context) => farmer.Home()));
                        else
                          Navigator.push(context, MaterialPageRoute(builder: (context) => consumer.Home()));
                      }
                    },
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () => {
                      if (userType == 'Consumer') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen()))
                      }
                      else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => fsignup.SignupScreen2()))
                      }
                      //signup screen
                    },
                  )
                ],
              ),
            ],
          )),
    );
  }
}
