import 'package:flutter/material.dart';
import 'package:rmpl_hrm/constants/colors.dart';
import 'package:rmpl_hrm/features/root/view/root_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RMPL HRM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
        ),
      ),
      home: const RootView(),
    );
  }
}
