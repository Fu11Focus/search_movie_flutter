import 'package:flutter/material.dart';

ThemeData customTheme = ThemeData(
    primaryColor: Colors.red[300],
    inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12)))),
    textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
      backgroundColor:
          MaterialStatePropertyAll(Color.fromARGB(255, 42, 116, 153)),
      foregroundColor: MaterialStatePropertyAll(Colors.white),
    )),
    cardTheme: const CardTheme(
      color: Colors.white,
    ));
