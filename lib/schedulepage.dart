import 'package:flutter/material.dart';
import 'schedule.dart';

class SchedulePage extends StatelessWidget {
  final String groupName;
  final Scheduler scheduler;
  const SchedulePage(this.scheduler, this.groupName, {super.key});

  @override
  Widget build(BuildContext context) {
    List<List<String>> listedSchedule =
        scheduler.getListedGroupSchedule(groupName);

    return Column(children: <Widget>[
      Container(
          margin: const EdgeInsets.all(20),
          child: Center(
            child: Text(
              'You have picked $groupName group',
              style: const TextStyle(fontSize: 45),
            ),
          )),
      Center(
          child: DataTable(
              columns: _createColumns(), rows: _createRows(listedSchedule)))
    ]);
  }

  List<DataColumn> _createColumns() {
    return const <DataColumn>[
      DataColumn(
        label: Expanded(
          child: Text(
            'Day',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: Text(
            'Lesson Number',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
      DataColumn(
        label: Expanded(
          child: Text(
            'Subject',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      )
    ];
  }

  List<DataRow> _createRows(List<List<String>> listedSchedule) {
    List<DataRow> rows = [];
    for (List<String> elements in listedSchedule) {
      List<DataCell> cells = [];
      for (String element in elements) {
        cells.add(DataCell(Text(element)));
      }
      rows.add(DataRow(cells: cells));
    }
    return rows;
  }
}
