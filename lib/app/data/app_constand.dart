import 'package:flutter/material.dart';
import 'package:get/get.dart';
//const KprimaryColor = Color(0xffCD9F41);

var KprimaryColor = Color(0xffd4b450);
const KaccentColor = Color(0xffF2F2F2);
const KScandtColor = Color(0xff707070);

String KuserTokan = '';
String KuserYoutubeTokan = '';
const AppName = 'Grow App';
String KtypePakcages = "subscribers";
const Kyoutube = "AIzaSyC8ph0Arqdy0u0I5kEqV44sXFPUSM7iOb0";

TextStyle styleInkWell = TextStyle(color: KprimaryColor, fontSize: 14);

TextStyle styleTextTitle =
    TextStyle(color: KprimaryColor, fontWeight: FontWeight.bold, fontSize: 26);

TextStyle styleTextSubTitle = TextStyle(
    color: KprimaryColor, fontWeight: FontWeight.normal, fontSize: 20);

TextStyle styleTextPackage =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10);

var categoriesItems = [].obs;

var subcategoriesItems = [].obs;
