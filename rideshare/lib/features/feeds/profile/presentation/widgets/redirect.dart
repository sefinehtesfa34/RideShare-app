import 'package:flutter/material.dart';

class Redirecting extends StatefulWidget {
  const Redirecting({super.key});

  @override
  State<Redirecting> createState() => _RedirectingState();
}

class _RedirectingState extends State<Redirecting> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text(
            'Redirecting...',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}