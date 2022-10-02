import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xfffa99cae),
          centerTitle: true,
          title: Text("CALENDAR"),
        ),

        body: SfCalendar(
          view: CalendarView.month,
          dataSource: MeetingDataSource(_getDataSource()),
          monthViewSettings: MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        ));
  }
}

List<Meeting> _getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
  DateTime(today.year, today.month, today.day, 10, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 48));

  final startTime1 = DateTime(2022, 10, 20);
  final endTime1 = startTime1.add(const Duration(hours: 2));

  final startTime3 = DateTime(2022, 10, 6);
  final endTime3 = startTime3.add(const Duration(hours: 2));

  final startTime2 = DateTime(2022, 10, 1);
  final endTime2= startTime3.add(const Duration(hours: 2));

  final startTime4 = DateTime(2022, 10, 12);
  final endTime4 = startTime1.add(const Duration(hours: 2));

  final startTime5 = DateTime(2022, 11, 1);
  final endTime5 = startTime.add(const Duration(hours: 2));

  final startTime6 = DateTime(2022, 11, 3);
  final endTime6 = startTime5.add(const Duration(hours: 160));

  meetings.add(Meeting(
      'Conference', startTime, endTime, const Color(0xFF0F8644), false));

  meetings.add(Meeting(
      'Coffee Chat', startTime1, endTime1, const Color(0xFF0F8644), false));

  meetings.add(Meeting(
      'Company Trip in Japan', startTime2, endTime2, const Color(0xFF0F8644), false));

  meetings.add(Meeting(
      'Meeting in UK', startTime3, endTime3, const Color(0xFF0F8644), false));

  meetings.add(Meeting(
      'Meeting in Australia', startTime4, endTime4, const Color(0xFF0F8644), false));

  meetings.add(Meeting(
      'Personal Plans', startTime5, endTime5, const Color(0xFF0F8644), false));

  return meetings;
}


class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}