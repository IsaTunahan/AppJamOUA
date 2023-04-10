import 'package:flutter/material.dart';

import '../../../colors.dart';

class EventSelectionPage extends StatefulWidget {
  final Function(String) onEventAdded;
  EventSelectionPage({required this.onEventAdded});

  @override
  _EventSelectionPageState createState() => _EventSelectionPageState();
}

class _EventSelectionPageState extends State<EventSelectionPage> {
  List<Map<String, dynamic>> options = [
    {"value": 1, "text": "Flutter 📱"},
    {"value": 2, "text": "Unity 🎮 "},
    {"value": 3, "text": "Oyun sanatı 🎨"},
    {"value": 4, "text": "Proje Yönetimi 💼"},
    {"value": 5, "text": "İngilizce 🇬🇧"},
    {"value": 6, "text": "Teknoloji Girişimciliği ⌨️"},
    {"value": 7, "text": "Yarışma Ekibi 🏆"},
    {"value": 8, "text": "Vize/Final Çalışması 📕"},
    {"value": 9, "text": "Kitap Okuma 📚"},
    {"value": 10, "text": "Fuar/Müze Gezisi 🦾"},
    {"value": 11, "text": "Kahve/Sohbet ☕"},
    {"value": 12, "text": "Diğer ⭐"},
  ];
  String _selectedOption = "Flutter📱";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategoriler'),
        centerTitle: true,
        backgroundColor: AppColors.blue,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          ...options.map((option) => RadioListTile(
            title: Text(option["text"]),
            value: option["text"],
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value.toString();
              });
            },
          )),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: GestureDetector(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_selectedOption != null) {
                          widget.onEventAdded(_selectedOption);
                          Navigator.of(context).pop();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Uygula',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}