import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarFormat: _calendarFormat,
      focusedDay: _focusedDay,
      firstDay: DateTime(2023),
      lastDay: DateTime(2024),
      startingDayOfWeek: StartingDayOfWeek.monday,
      // rowHeight: 50,
      daysOfWeekHeight: 20,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        formatButtonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey)),
      ),
      daysOfWeekStyle: const DaysOfWeekStyle(
          weekendStyle: TextStyle(color: Colors.red),
          weekdayStyle: TextStyle(color: primaryColor)),
      calendarStyle: const CalendarStyle(
          // canMarkersOverflow: true
          weekendTextStyle: TextStyle(color: Colors.red),
          todayDecoration:
              BoxDecoration(color: buttonColor, shape: BoxShape.circle),
          selectedDecoration:
              BoxDecoration(color: borderColor, shape: BoxShape.circle)),
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
    );
  }
}
