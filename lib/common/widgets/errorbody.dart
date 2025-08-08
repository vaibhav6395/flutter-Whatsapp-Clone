import 'package:flutter/material.dart';

class Errorbody extends StatelessWidget {
  final String Error;
  const Errorbody({super.key, required this.Error});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(Error));
  }
}
