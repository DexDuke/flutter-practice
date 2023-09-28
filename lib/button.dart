// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

final ButtonStyle buttonPrimary=ElevatedButton.styleFrom(
  minimumSize: Size(219,50), backgroundColor: Color.fromARGB(255, 0, 133, 255),
  elevation: 0, shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10))
  ),foregroundColor: Colors.black,
);

final ButtonStyle buttonCircleBlue=ElevatedButton.styleFrom(
  minimumSize: Size(140,140), backgroundColor: Color.fromARGB(255, 0, 133, 255),
  elevation: 0, shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(140))
  ),foregroundColor: Colors.black,
);


