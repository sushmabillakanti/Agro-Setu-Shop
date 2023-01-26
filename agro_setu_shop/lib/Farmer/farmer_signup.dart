import 'package:agro_setu_shop/Consumer/sign_up2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:agro_setu_shop/Consumer/home.dart';
import '../helpers.dart';
import '../constants.dart';
import '../form_error.dart' show FormError;
// import '../helpers.dart';
// import 'farmer_signup2.dart';

class SignupScreen2 extends StatelessWidget {
  const SignupScreen2 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Agro Setu Shop'),
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 25, bottom: 5),
            child: Text(
              "Register Account",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 280,
            child: Text(
              "Let us know more about you by completing the details",
              textAlign: TextAlign.center,
            ),
          ),
          SignUpForm()
        ],
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

final TextEditingController email = TextEditingController();
// final TextEditingController userName = TextEditingController();
// final TextEditingController phoneNumber = TextEditingController();
final TextEditingController password = TextEditingController();
// final TextEditingController address = TextEditingController();

bool isWorking = false;

class _SignUpFormState extends State<SignUpForm> {

  String? em;
  String? pwd;
  String? c_pwd;
  final List<String?> errors = [];

  void submit() async {
    UserCredential? result;
    try {
      setState(() {
        isWorking = true;
      });
      result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
      print(result);
    } on PlatformException catch (e) {
      var msg = "Please check your internet connection";
      if (e.message != null) {
        msg = e.message!;
      }
      setState(() {
        isWorking = false;
      });
    } catch (e) {
      setState(() {
        isWorking = false;
      });
      print(e);
    }

    FirebaseFirestore.instance.collection("Suppliers").doc(result?.user?.uid).set({
      // "UserName": userName.text,
      "UserId": result?.user?.uid,
      "UserEmail": email.text,
      // "UserAddress": address.text,
      // "UserNumber": phoneNumber.text,
    });

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => SignUp()));
    setState(() {
      isWorking = false;
    });

  }

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: _scaffoldKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildEmailFormField(),
              SizedBox(height: 30),
              buildPasswordFormField(),
              SizedBox(height: 30),
              buildConformPassFormField(),
              FormError(errors: errors),
              SizedBox(height: 50),
              DefaultButton(
                text: "Continue",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                  submit();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => c_pwd = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == c_pwd) {
          removeError(error: kMatchPassError);
        }
        c_pwd = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return "";
      },
      decoration: const InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock_outline_rounded),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: password,
      onSaved: (newValue) => pwd = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        setState(() {
          pwd = value;
        });
        pwd = value;
        print(password);
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return "";
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.lock_outline_rounded,
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: email,
      onSaved: (newValue) => em = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        setState(() {
          em = value;
        });
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return "";
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.mail_outline_rounded,
        ),
      ),
    );
  }
}
