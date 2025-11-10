import 'package:flutter/material.dart';

class CustomMessageError extends StatelessWidget {
  const CustomMessageError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'ooops find error,try agin later',
        style: TextStyle(
          color: Colors.red,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
