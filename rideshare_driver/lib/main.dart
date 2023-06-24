import 'package:flutter/material.dart';

class JourneyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journey Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text('Your Journey starts in:'),
                SizedBox(width: 8.0),
                CountdownTimer(),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Implement cancel button functionality
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ),
          Text('Added Passengers'),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3, // Replace with actual passenger count
            itemBuilder: (context, index) {
              return PassengerCard();
            },
          ),
          Text('All passengers'),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3, // Replace with actual car count
            itemBuilder: (context, index) {
              return CarCard();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Implement start journey button functionality
        },
        backgroundColor: Colors.green,
        icon: Icon(Icons.play_arrow),
        label: Text('Start Journey'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class CountdownTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement countdown timer widget
    return Text('5:00'); // Replace with actual countdown implementation
  }
}

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

void main() {
  runApp(MaterialApp(home: JourneyPage()));
}