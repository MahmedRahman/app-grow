import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defualtappBar({@required String title}) => PreferredSize(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/bg_title.png'),
          fit: BoxFit.fill,
        )),
        child: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
      ),
      preferredSize: Size.fromHeight(60),
    );
