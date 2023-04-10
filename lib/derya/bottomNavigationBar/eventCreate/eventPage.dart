import 'package:app_jam_oua/derya/bottomNavigationBar/HomePage.dart';
import 'package:app_jam_oua/derya/listView.dart';
import 'package:app_jam_oua/pages/maps_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../colors.dart';
import 'category_Selection.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final List<String> _selectedEvents = [];
  void _addEvent(String event) {
    setState(() {
      _selectedEvents.add(event);
    });
  }

  final _createTitleController = TextEditingController();
  final _createDescriptionController = TextEditingController();
  final _createDateController = TextEditingController();
  final _creatTimeController = TextEditingController();

  TimeOfDay _timeOfDay = const TimeOfDay(hour: 8, minute: 30);

  void _showTimePicker(BuildContext context) async {
    var _pickedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (_pickedTime != null) {
      setState(() {
        _timeOfDay = _pickedTime;
        _creatTimeController.text = _pickedTime.format(context).toString();
      });
    }
  }

  DateTime _dateTime = DateTime.now();

  _selectedCreateDate(BuildContext context) async {
    var _pickedDate = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_pickedDate != null) {
      setState(() {
        _dateTime = _pickedDate;
        _createDateController.text =
            DateFormat('dd-MM-yyyy').format(_pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Etkinlik oluştur'),
        centerTitle: true,
        backgroundColor: AppColors.blue,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _createTitleController,
                    decoration: const InputDecoration(
                      labelText: 'Etkinlik Adı',
                      hintText: 'Etkinlik Adı Yazınız',
                    ),
                  ),
                  TextField(
                    controller: _createDescriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Açıklama',
                      hintText: 'Açıklama Yazınız',
                    ),
                  ),
                  TextField(
                    controller: _createDateController,
                    decoration: InputDecoration(
                        labelText: 'Tarih',
                        hintText: 'Tarih Seçiniz',
                        prefixIcon: InkWell(
                          onTap: () {
                            _selectedCreateDate(context);
                          },
                          child: const Icon(Icons.calendar_today),
                        )),
                  ),
                  TextField(
                    controller: _creatTimeController,
                    decoration: InputDecoration(
                        labelText: 'Saat',
                        hintText: 'Saat Seçiniz',
                        prefixIcon: InkWell(
                          onTap: () {
                            _showTimePicker(context);
                          },
                          child: const Icon(Icons.timer),
                        )),
                  ),
                  Row(
                    children: [
                      Expanded(child: Text('Lokasyon:    ')),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MapScreen(
                                      initialAddress: "İstanbul, Türkiye")),
                            );
                          },
                          child: Text('Harita sayfası'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: const Text(
                      'Kategori:',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ..._selectedEvents.map((event) => Text(event)),
                  const SizedBox(
                    height: 20,
                  ),
                      Expanded(
                        child: ButtonTheme(
                          minWidth: 100.0,
                          height: 40.0,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => EventSelectionPage(
                                        onEventAdded: _addEvent)),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ListViewPage();
                        }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green,
                      ),
                      child: const Text(
                        'Kaydet',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              )),
        ),
      ),
    );
  }
}
