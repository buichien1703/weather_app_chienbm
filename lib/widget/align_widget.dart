import 'dart:ui';

import 'package:flutter/material.dart';

Widget alignWidget(Widget child) {
  return Stack(
    children: [
      Align(
        alignment: AlignmentDirectional(3, -0.3),
        child: Container(
          height: 300,
          width: 300,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepPurple,
          ),
        ),
      ),
      Align(
        alignment: AlignmentDirectional(-3, -0.3),
        child: Container(
          height: 300,
          width: 300,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepPurple,
          ),
        ),
      ),
      Align(
        alignment: AlignmentDirectional(0, -1.2),
        child: Container(
          height: 300,
          width: 600,
          decoration: const BoxDecoration(
            color: Colors.orange,
          ),
        ),
      ),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
        ),
      ),
    child
    ],
  );
}
