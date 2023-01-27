import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetFarmersData {
  // final User? currentUser = FirebaseAuth.instance.currentUser;
  final User user;

  GetFarmersData(this.user);

  final CollectionReference ref =
      FirebaseFirestore.instance.collection('Farmers');

  Future getUser() async {
    DocumentSnapshot? userDetails;
    try {
      await ref.doc(user.uid).get().then((value) => {userDetails = value});
      return userDetails;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // final User? currentUser = FirebaseAuth.instance.currentUser;
  // final CollectionReference ref = FirebaseFirestore.instance.collection('Farmers')
  DocumentSnapshot? userDetail;
  

  @override
  void initState() {
    // TODO: implement initState
    fetchDetails();
    super.initState();
  }

  Future<String?> getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;

  }

  fetchDetails() async {
    // DocumentSnapshot? userDetails;
    final CollectionReference ref =
        FirebaseFirestore.instance.collection('Suppliers');
    User? cu = FirebaseAuth.instance.currentUser;
    print(cu?.uid);

    try {
      await ref.doc(cu?.uid).get().then((value) => {userDetail = value});
      // return userDetails;
    } catch (e) {
      print(e.toString());
      // return null;
    }
    // DocumentSnapshot user = await GetFarmersData(cu!).getUser();
    // if (user == null) {
    //   print("Details not found");
    // } else {
    //   print(userDetails);
    //   setState(() {
    //     userDetails = user;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context)  {
    String text = "Hello " + userDetail?['UserName'];
    return Column(
      children: [
        // FutureBuilder(
        //   future: OAuthProvider.of(context).auth.getCurrentUID(),
        // )
      ],
    );
  }
  //
  // Widget dashboard(BuildContext context) {
  //
  // }
}
