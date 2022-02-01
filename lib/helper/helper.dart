import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class Helper {
  static Color getColorByPosition(String position) {
    switch (position) {
      case "G-F":
        return Colors.green;
      case "C":
        return Colors.orange;
      case "F":
        return Colors.purple;
      case "G":
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

}
