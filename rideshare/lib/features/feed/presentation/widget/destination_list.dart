import 'package:flutter/material.dart';
import 'package:rideshare/features/feed/domain/entities/destination.dart';

class DestinationList extends StatelessWidget {
  Destination destination;
  DestinationList(this.destination);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Icon(Icons.map),
          SizedBox(width: 10),
          Text(destination.name)
        ],
      ),
    );
  }
}

