import 'package:flutter/material.dart';
import 'package:emergency_app/event.dart';
import 'package:emergency_app/event_details_screen.dart';
import 'package:emergency_app/event_registration_screen.dart';
import 'package:emergency_app/event_edit_screen.dart';

//Amín Jesús Báez Espinosa 2021-0929

class EventListScreen extends StatefulWidget {
  @override
  _EventListScreenState createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  List<Event> events = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos'),
        backgroundColor: Colors.redAccent,
      ),
      body: events.isEmpty
          ? Center(
              child: Text(
                '¡Comienza a registrar eventos!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.red[50],
                  child: ListTile(
                    title: Text(
                      events[index].title,
                      style: TextStyle(color: Colors.black87),
                    ),
                    subtitle: Text(
                      events[index].description,
                      style: TextStyle(color: Colors.black54),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          color: Colors.redAccent,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EventEditScreen(event: events[index]),
                              ),
                            ).then((editedEvent) {
                              if (editedEvent != null) {
                                setState(() {
                                  events[index] = editedEvent;
                                });
                              }
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.redAccent,
                          onPressed: () {
                            _showDeleteConfirmationDialog(context, index);
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EventDetailsScreen(event: events[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EventRegistrationScreen()),
          ).then((newEvent) {
            if (newEvent != null) {
              setState(() {
                events.add(newEvent);
              });
            }
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirmar eliminación'),
        content: Text('¿Está seguro de que desea eliminar este evento?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                events.removeAt(index);
              });
              Navigator.of(context).pop();
            },
            child: Text('Eliminar'),
          ),
        ],
      ),
    );
  }
}
