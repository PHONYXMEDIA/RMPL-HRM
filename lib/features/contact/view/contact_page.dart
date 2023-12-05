import 'package:flutter/material.dart';
import 'package:rmpl_hrm/features/contact/contact.dart';

class ContactPage extends StatelessWidget {
  static Route<void> route() => MaterialPageRoute(
        builder: (_) => const ContactPage(),
      );

  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ContactView();
  }
}
