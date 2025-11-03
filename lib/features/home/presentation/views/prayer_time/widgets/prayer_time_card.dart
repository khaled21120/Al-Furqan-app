import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/themes/text_style.dart';

class PrayerTimeCard extends StatelessWidget {
  const PrayerTimeCard({
    super.key,
    required this.title,
    required this.time,
    required this.icon,
    required this.color,
  });
  final String title, time;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final localDate = DateTime.parse(time).toLocal();
    final formattedTime = DateFormat.jm('ar').format(localDate);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: Icon(icon, color: color, size: 30),
          title: Text(title, style: MyStyle.title18(context)),
          trailing: Text(formattedTime, style: MyStyle.splash18(context)),
        ),
      ),
    );
  }
}
