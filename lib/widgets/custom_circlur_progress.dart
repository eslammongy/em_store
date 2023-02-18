import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils/colors.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1),
      duration: const Duration(milliseconds: 3500),
      builder: (context, value, _) => CircularProgressIndicator(
        value: value,
        color: Colors.deepPurple,
      ),
    );
  }
}
