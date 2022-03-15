import 'package:flutter/material.dart';

class LoadingCircleComponent extends StatelessWidget {
  const LoadingCircleComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
