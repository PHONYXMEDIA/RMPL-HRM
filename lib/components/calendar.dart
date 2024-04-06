import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:rmpl_hrm/extensions/object/log.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;
  EventList<Event> _markedDates = EventList<Event>(events: {});

  List<DateTime> presentDates = [];
  List<DateTime> absentDates = [];
  List<DateTime> guestedHolidayDates = [];
  List<DateTime> leaveDates = [];

  Future<void> fetchData() async {
    presentDates.clear();
    leaveDates.clear();
    guestedHolidayDates.clear();
    absentDates.clear();
    try {
      final data = await FirebaseFirestore.instance
          .collection('common')
          .doc('attendance')
          .collection('6sT5eD9ZsCSAwEAP4ibU3oP0Kb32')
          .doc('2023')
          .collection('12')
          .get();

      setState(() {
        data.docs.forEach((doc) {
          final String day = doc.id;
          final String month = doc.reference.parent.id;
          final String year = doc.reference.parent.parent?.id ?? '';
          final bool isPresent = doc.exists;

          if (isPresent) {
            final String dateString = '$year-$month-$day';
            final DateTime date = DateTime.parse(dateString);
            presentDates.add(date);
          }
        });

        updateMarkedDates();
      });
    } catch (error) {
      print('Error fetching attendance data: $error');
    }
  }

  Future<void> fetchHolidays() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data =
          await FirebaseFirestore.instance.collection('holidays').get();

      setState(() {
        for (var doc in data.docs) {
          final Timestamp timestamp = doc['date'] as Timestamp;
          final DateTime day = timestamp.toDate();
          final DateTime dateOnly = DateTime(day.year, day.month, day.day);

          final bool isHoliday = doc.exists;

          if (isHoliday) {
            // print("####### holiday ${dateOnly} #######");
            guestedHolidayDates.add(dateOnly);
          }
        }

        updateMarkedDates();
        print(guestedHolidayDates);
      });
    } catch (error) {
      print('Error fetching holidays data: $error');
    }
  }

  Future<void> fetchLeaves() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> data =
          await FirebaseFirestore.instance.collection('leave').get();

      setState(() {
        for (var doc in data.docs) {
          final Timestamp timestamp = doc['date'] as Timestamp;
          final DateTime day = timestamp.toDate();
          final DateTime dateOnly = DateTime(day.year, day.month, day.day);
          final bool isLeaves = doc.exists;

          if (isLeaves) {
            // print("####### leaves ${dateOnly} #######");

            leaveDates.add(dateOnly);
          }
        }

        updateMarkedDates();
        print(leaveDates);
      });
    } catch (error) {
      print('Error fetching leaves data: $error');
    }
  }

  void updateMarkedDates() {
    _markedDates = EventList<Event>(events: {});

    for (var date in presentDates) {
      _markedDates.add(
        date,
        Event(
          date: date,
          title: 'Present',
        ),
      );
    }

    for (var date in absentDates) {
      _markedDates.add(
        date,
        Event(
          date: date,
          title: 'Absent',
        ),
      );
    }

    for (var date in guestedHolidayDates) {
      _markedDates.add(
        date,
        Event(
          date: date,
          title: 'Guested Holiday',
        ),
      );
    }

    for (var date in leaveDates) {
      _markedDates.add(
        date,
        Event(
          date: date,
          title: 'Leave',
        ),
      );
    }

    for (var element in _markedDates.events.entries) {
      '${element.key} - ${element.value.toString()}'.log();
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchHolidays();
    fetchLeaves();
  }

  @override
  Widget build(BuildContext context) {
    return CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        setState(() {
          _selectedDay = date;
        });
      },
      showWeekDays: true,
      showHeader: true,
      todayButtonColor: Colors.blue,
      markedDatesMap: _markedDates,
      selectedDateTime: _selectedDay,
      daysHaveCircularBorder: true,
      customGridViewPhysics: const NeverScrollableScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      markedDateMoreShowTotal: true,
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      weekendTextStyle: const TextStyle(color: Colors.red),
      headerTextStyle: const TextStyle(color: Colors.black),
      headerMargin: const EdgeInsets.symmetric(vertical: 16.0),
      weekdayTextStyle: const TextStyle(color: Colors.black),
      weekFormat: false,
      height: 420.0,
      childAspectRatio: 1.0,
      firstDayOfWeek: 1,
      customDayBuilder: (
        bool isSelectable,
        int index,
        bool isSelectedDay,
        bool isToday,
        bool isPrevMonthDay,
        TextStyle textStyle,
        bool isNextMonthDay,
        bool isThisMonthDay,
        DateTime day,
      ) {
        Color cellColor = Colors.transparent;

        if (!isSelectable) {
          cellColor = Colors.grey;
        } else {
          if (isThisMonthDay) {
            if (presentDates.contains(day)) {
              cellColor = Colors.green;
            } else if (absentDates.contains(day)) {
              cellColor = Colors.red;
            } else if (guestedHolidayDates.contains(day)) {
              cellColor = Colors.purple;
            } else if (leaveDates.contains(day)) {
              cellColor = Colors.grey;
            }
          }
        }

        return Center(
          child: Container(
            decoration: BoxDecoration(
              color: cellColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                '${day.day}',
                style: textStyle.copyWith(
                  color: isToday
                      ? Colors.white
                      : isSelectable
                          ? Colors.black
                          : Colors.grey,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
