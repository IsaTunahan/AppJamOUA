import 'package:flutter/material.dart';

import 'category_Selection.dart';

class EventWritePage extends StatefulWidget {
  @override
  _EventWritePageState createState() => _EventWritePageState();
}

class _EventWritePageState extends State<EventWritePage> {
  List<String> _selectedEvents = [];

  void _addEvent(String event) {
    setState(() {
      _selectedEvents.add(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: [
          ButtonTheme(
            minWidth: 100.0,
            height: 40.0,
            child: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          EventSelectionPage(onEventAdded: _addEvent)),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Selected events:',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          ..._selectedEvents.map((event) => Text(event)),
        ],
      ),
    );
  }
}