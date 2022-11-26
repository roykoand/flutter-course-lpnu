import 'package:yaml/yaml.dart';

class Group {
  String groupName;
  Group(this.groupName);
}

class Subject {
  String subjectName;
  Subject(this.subjectName);
}

class LessonNumber {
  int lessonNumber;
  LessonNumber(this.lessonNumber);
}

class Day {
  String dayName;
  Day(this.dayName);

  Day deabbriviateDataName() {
    Map<String, String> abbrMapper = {
      'Mo': 'Monday',
      'Tu': 'Tuesday',
      'We': 'Wednesday',
      'Th': 'Thursday',
      'Fr': 'Friday',
      'Sa': 'Saturday',
      'Su': 'Sunday'
    };
    return Day(abbrMapper[dayName].toString());
  }
}

class GroupSchedule {
  YamlMap rawGroupSchedule;
  Map<Day, Map<LessonNumber, Subject>> groupSchedule = {};
  GroupSchedule(this.rawGroupSchedule) {
    for (String day in rawGroupSchedule.keys) {
      for (int lesSubj in rawGroupSchedule[day]!.keys) {
        Map<LessonNumber, Subject> lessonSubject = {};
        lessonSubject[LessonNumber(lesSubj)] =
            Subject(rawGroupSchedule[day]![lesSubj]!);
        groupSchedule[Day(day).deabbriviateDataName()] = lessonSubject;
      }
    }
  }
}

class Scheduler {
  Map<dynamic, dynamic> yamlScheduleMap;
  Map<Group, GroupSchedule> scheduleMap = {};
  Scheduler(this.yamlScheduleMap) {
    for (String group in yamlScheduleMap.keys) {
      scheduleMap[Group(group)] = GroupSchedule(yamlScheduleMap[group]!);
    }
  }

  GroupSchedule? getScheduleForGroup(String groupName) {
    for (Group group in scheduleMap.keys) {
      if (group.groupName == groupName) {
        return scheduleMap[group]!;
      }
    }
    return null;
  }

  List<String> getGroupsList() {
    List<String> groups = [];
    for (Group group in scheduleMap.keys) {
      groups.add(group.groupName);
    }
    return groups;
  }

  List<List<String>> getListedGroupSchedule(String groupName) {
    GroupSchedule? schedule = getScheduleForGroup(groupName);
    List<List<String>> listedSchedule = [];
    for (Day day in schedule!.groupSchedule.keys) {
      for (LessonNumber lesSubj in schedule.groupSchedule[day]!.keys) {
        listedSchedule.add([
          day.dayName,
          lesSubj.lessonNumber.toString(),
          schedule.groupSchedule[day]![lesSubj]!.subjectName
        ]);
      }
    }
    return listedSchedule;
  }
}
