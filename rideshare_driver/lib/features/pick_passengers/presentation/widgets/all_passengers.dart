import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: ListTile(
        leading: CircleAvatar(
          // Replace with car image
          child: Text('C'), // Example placeholder
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Car Name'),
            Text('Where'),
            Text('When'),
          ],
        ),
        trailing: Column(
          children: [
            Text('100birr'),
            Text('1 seat'),
            ElevatedButton(
              onPressed: () {
                // Implement add button functionality
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}