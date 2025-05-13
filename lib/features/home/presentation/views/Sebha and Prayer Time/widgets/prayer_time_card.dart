import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quran/core/utils/helper.dart';

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
    // Trim any unnecessary spaces and parse the time
    String cleanTime = time.trim();
    DateTime? timeInDateTime = Helper.parse24HourTime(cleanTime);

    // Convert to 12-hour Arabic format if valid, else use original time
    String formattedTime =
        timeInDateTime != null
            ? DateFormat('hh:mm a', 'ar').format(
              timeInDateTime,
            ) // Arabic 12-hour format
            : cleanTime;

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
