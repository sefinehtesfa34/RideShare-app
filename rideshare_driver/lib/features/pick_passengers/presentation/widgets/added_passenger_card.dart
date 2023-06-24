import 'package:flutter/material.dart';

class PassengerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          // Replace with passenger image
          child: Text('P'), // Example placeholder
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Passenger Name'),
            Text('Destination'),
            Text('Seat Number'),
          ],
        ),
        trailing: Column(
          children: [
            Text('100birr'),
            ElevatedButton(
              onPressed: () {
                // Implement call button functionality
              },
              child: Icon(Icons.call),
            ),
          ],
        ),
        // trailing: Icon(Icons.remove), // Minus icon
      ),
    );
  }
}