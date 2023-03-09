import 'package:flutter/material.dart';


  dpcust(String typeof) {
    return Container(
      width: 380,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(typeof),
    );
  }

