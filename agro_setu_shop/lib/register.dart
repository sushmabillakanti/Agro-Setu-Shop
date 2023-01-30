import 'package:flutter/material.dart';

import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? user;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 130, bottom: 20),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 80,
              ),
            ),
          ),
          Text(
            'Agro Setu Shop',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22,
                color: Colors.green.shade800),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text(
              "I'm a..",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Card(
              color: (user == 'consumer')? Colors.orange.shade100: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/buy.png",
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 8, right: 60),
                    child: SizedBox(
                      width: 100,
                      child: Text(
                        "Customer",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  ),
                  Radio(
                    value: 'consumer',
                    groupValue: user,
                    onChanged: (value) {
                      setState(() {
                        user = value;
                        // color = Colors.orange.shade100;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Card(
              color: (user == 'farmer')? Colors.orange.shade100: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/sell.png",
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 8, right: 60),
                    child: SizedBox(
                      width: 100,
                      child: Text(
                        "Farmer",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  ),
                  Radio(
                    value: 'farmer',
                    groupValue: user,
                    onChanged: (value) {
                      setState(() {
                        user = value;
                        color = Colors.orange.shade100;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              width: double.maxFinite,
              height: 55,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  )),
            ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have the account?'),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (MyStatefulWidget())));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
