import 'package:flutter/material.dart';
import 'package:emergency_app/event.dart';

//Amín Jesús Báez Espinosa 2021-0929

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  EventDetailsScreen({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Evento'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              event.description,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Fecha: ${event.date}',
              style: TextStyle(fontSize: 16),
            ),
            if (event.imageUrl != null) ...[
              SizedBox(height: 16),
              Image.network(event.imageUrl!),
            ],
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
