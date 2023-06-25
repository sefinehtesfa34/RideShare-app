import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class StartJourneyIn extends StatelessWidget {
  const StartJourneyIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Your Journey starts in:'),
        SizedBox(width: 8.0),
        // CountdownTimer(),
        SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {
            // Implement cancel button functionality
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
