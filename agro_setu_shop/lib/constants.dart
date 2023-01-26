import 'package:flutter/material.dart';

final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

const MONGO_URL = "mongodb+srv://agro_setu_shop:agrosetu@cluster0.kbevohg.mongodb.net/agro_setu_shop?retryWrites=true&w=majority";
const COLLECTION_NAME = "consumers";