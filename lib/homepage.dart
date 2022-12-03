import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';
import 'schedule.dart' show Scheduler;
import 'helpers.dart' show yamlToMap;
import 'schedulepage.dart' show SchedulePage;

class HomePage extends StatefulWidget {
  final String firstName, lastName;
  const HomePage(this.firstName, this.lastName, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _Schedule();
}

class _Schedule extends State<HomePage> {
  late YamlMap yamlScheduleMap = yamlToMap();
  late Scheduler scheduler = Scheduler(yamlScheduleMap);
  late String groupName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home page'), centerTitle: true),
        body: Column(children: <Widget>[
          Container(
              margin: const EdgeInsets.all(20),
              child: Center(
                  child: Text(
                'Вітаю ${widget.lastName} ${widget.firstName}',
                style: const TextStyle(fontSize: 45),
              ))),
          Container(
              margin: const EdgeInsets.all(20),
              child: Center(
                  child: DropdownButton<String>(
                items: scheduler.getGroupsList().map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    groupName = value!;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SchedulePage(scheduler, groupName)),
                  );
                },
              )))
        ]));
  }
}
