import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hijri_calendar/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:quran/features/home/presentation/views/prayer_time/widgets/prayer_time_card.dart' show PrayerTimeCard;
import '../../../../../core/services/notfiy_service.dart';
import '../../../../../core/themes/text_style.dart';
import '../../../cubits/prayer_cubit/prayer_cubit.dart';

import '../../../data/models/prayer/timings.dart';

class PrayerTimeView extends StatefulWidget {
  const PrayerTimeView({super.key});

  @override
  State<PrayerTimeView> createState() => _PrayerTimeViewState();
}

class _PrayerTimeViewState extends State<PrayerTimeView> {
  DateTime dateTime = DateTime.now();
  bool _notificationsScheduled = false;

  @override
  void initState() {
    super.initState();
    _fetchPrayerTime();
  }

  void _fetchPrayerTime() {
    String formattedDate = DateFormat('dd-MM-yyyy', 'en').format(dateTime);
    context.read<PrayerCubit>().getPrayerTime(date: formattedDate);
    _notificationsScheduled = false;
  }

  Future<void> _timePicker() async {
    final date = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (date != null) {
      setState(() {
        dateTime = date;
      });
      _fetchPrayerTime();
    }
  }

  void _schedulePrayerNotifications(Timings? timings) async {
    // in _schedulePrayerNotifications
    await NotifyService.cancelAllNotifications();
    if (timings == null || _notificationsScheduled) return;

    final prayers = [
      {'id': 0, 'title': 'الفجر', 'time': timings.fajr},
      {'id': 1, 'title': 'الظهر', 'time': timings.dhuhr},
      {'id': 2, 'title': 'العصر', 'time': timings.asr},
      {'id': 3, 'title': 'المغرب', 'time': timings.maghrib},
      {'id': 4, 'title': 'العشاء', 'time': timings.isha},
    ];

    for (final prayer in prayers) {
      final prayerTimeString = prayer['time'] as String?;
      if (prayerTimeString == null || prayerTimeString.isEmpty) continue;

      final dt = DateTime.parse(prayerTimeString.trim()).toLocal();

      await NotifyService.showScheduleNotification(
        id: prayer['id'] as int,
        title: 'موعد الصلاة',
        body: 'حان الآن وقت صلاة ${prayer['title']}',
        scheduledDate: dt,
      );
    }

    _notificationsScheduled = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('أوقات الصلاة')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<PrayerCubit, PrayerState>(
          listener: (context, state) {
            if (state is PrayerLoaded && !_notificationsScheduled) {
              final timings = state.prayerTime.timings;
              if (timings != null) {
                _schedulePrayerNotifications(timings);
              }
            }
          },
          builder: (context, state) {
            if (state is PrayerLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PrayerError) {
              return Center(
                child: Text(
                  state.errMsg,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else if (state is PrayerLoaded) {
              final prayerTime = state.prayerTime.timings;

              return ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  // Date Section
                  _buildDateSection(state),
                  const SizedBox(height: 20),

                  // Prayer Times Cards
                  _buildPrayerTimeCards(prayerTime!),
                ],
              );
            }
            return const Center(child: Text('No Data Available'));
          },
        ),
      ),
    );
  }

  Widget _buildDateSection(PrayerLoaded state) {
    return Column(
      children: [
        Text(
          DateFormat.yMMMEd('ar').format(dateTime),
          style: MyStyle.title18(context),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          _formatHijriDate(state.prayerTime.date?.hijri?.date ?? ''),
          style: MyStyle.title18(context),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _timePicker,
          child: const Text('اختر التاريخ'),
        ),
      ],
    );
  }

  Widget _buildPrayerTimeCards(Timings prayerTime) {
    return Column(
      children: [
        PrayerTimeCard(
          title: 'الفجر',
          time: prayerTime.fajr ?? '',
          icon: Icons.wb_twilight,
          color: Colors.lightBlue,
        ),
        PrayerTimeCard(
          title: 'الشروق',
          time: prayerTime.sunrise ?? '',
          icon: Icons.wb_sunny_outlined,
          color: Colors.yellow[700]!,
        ),
        PrayerTimeCard(
          title: 'الظهر',
          time: prayerTime.dhuhr ?? '',
          icon: Icons.wb_sunny,
          color: Colors.amber[700]!,
        ),
        PrayerTimeCard(
          title: 'العصر',
          time: prayerTime.asr ?? '',
          icon: Icons.wb_cloudy,
          color: Colors.orange[700]!,
        ),
        PrayerTimeCard(
          title: 'المغرب',
          time: prayerTime.maghrib ?? '',
          icon: Icons.nightlight_round,
          color: Colors.deepOrange[700]!,
        ),
        PrayerTimeCard(
          title: 'العشاء',
          time: prayerTime.isha ?? '',
          icon: Icons.bedtime,
          color: Colors.indigo[700]!,
        ),
      ],
    );
  }

  String _formatHijriDate(String date) {
    try {
      HijriCalendarConfig.language = 'ar';

      final parts = date.split('-');
      if (parts.length != 3) return 'تاريخ هجري غير متاح';

      final day = int.tryParse(parts[0]);
      final month = int.tryParse(parts[1]);
      final year = int.tryParse(parts[2]);

      if (day == null || month == null || year == null) {
        return 'تاريخ هجري غير متاح';
      }

      final hijriDate =
          HijriCalendarConfig()
            ..hYear = year
            ..hMonth = month
            ..hDay = day;

      return '${hijriDate.hDay} ${hijriDate.getLongMonthName()} ${hijriDate.hYear}';
    } catch (e) {
      return 'تاريخ هجري غير متاح';
    }
  }
}
