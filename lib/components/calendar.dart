import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  EventList<Event> _markedDates = EventList<Event>(events: {});

  // Dummy data representing present, absent, and guested holiday dates
  List<DateTime> presentDates = [
    DateTime(2023, 12, 5),

    // Add more present dates as needed
  ];

  List<DateTime> absentDates = [
    DateTime(2023, 12, 8),
    DateTime(2023, 12, 15),
    // Add more absent dates as needed
  ];

  List<DateTime> guestedHolidayDates = [
    DateTime(2023, 12, 20),
    DateTime(2023, 12, 25),
    // Add more guested holiday dates as needed
  ];
  List<DateTime> leaveDates = [
    DateTime(2023, 12, 24),
    DateTime(2023, 12, 29),
  ];

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
      // Set color for the selected day button
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

        // Mark Saturday and Sunday as off (gray color)
        if (!isSelectable) {
          cellColor = Colors.grey;
        } else {
          if (isThisMonthDay) {
            if (presentDates.contains(day)) {
              cellColor = Colors.green;
              _markedDates.add(
                day,
                Event(
                  date: day,
                  title: 'Present',
                ),
              );
            } else if (absentDates.contains(day)) {
              cellColor = Colors.red;
              _markedDates.add(
                day,
                Event(
                  date: day,
                  title: 'Absent',
                ),
              );
            } else if (guestedHolidayDates.contains(day)) {
              cellColor = Colors.purple;
              _markedDates.add(
                day,
                Event(
                  date: day,
                  title: 'Guested Holiday',
                ),
              );
            }
          } else if (leaveDates.contains(day)) {
            cellColor = Colors.black;
            _markedDates.add(
              day,
              Event(
                date: day,
                title: 'Leave Holiday',
              ),
            );
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
