import 'package:agro_setu_shop/Consumer/search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Farmer/Farmer_home.dart' as farmer;
import 'Farmer/farmer_signup2.dart';
import 'Farmer/farmer_signup.dart' as farmer2;
import 'package:agro_setu_shop/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:agro_setu_shop/login.dart' as login;
import '../Consumer/search.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  //
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home : CustomSearchDelegate(),
      debugShowCheckedModeBanner: false,
      title: 'Agro Setu Shop',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
       home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //const MyHomePage({super.key, required this.title});

  //final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        // stream: Auth().authStateChanges,
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          // return MainBody();
          if(snapshot.connectionState == ConnectionState.done) {
            print(snapshot.connectionState);
            return MainBody();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //       title: Text('Agro Setu Shop'),
        //     ),
      body: HomeCarousel(),
    );
  }
}

class Signing extends StatelessWidget {
  const Signing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeCarousel()));
            },
            child: Text('Goto Home page'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => farmer2.SignupScreen2()));
            },
            child: Text('Goto Farmers Home page'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => login.MyStatefulWidget()));
            },
            child: Text('Goto Login'),
          ),
        ],
      ),
    );
  }
}

