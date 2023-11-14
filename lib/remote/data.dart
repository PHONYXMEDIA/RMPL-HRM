import 'package:rmpl_hrm/models/employee.dart';

import '../constants/constants.dart';

class Data {
  static Future<Employee?> getEmployee(String uid) async {
    try {
      final documentSnapshot = await db.collection('employees').doc(uid).get();
      if (!documentSnapshot.exists) return null;
      return Employee.fromJson(documentSnapshot.data()!);
    } catch (_) {
      return null;
    }
  }
}
