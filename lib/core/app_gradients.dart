import 'dart:math';
import 'package:flutter/material.dart';

class AppGradients {
  static const linear = LinearGradient(colors: [
    Color(0xFFFF8489),
    Color.fromRGBO(213, 173, 200, 0.695),
  ], stops: [
    0.0,
    0.695
  ], transform: GradientRotation(2.13959913 * pi));
}
