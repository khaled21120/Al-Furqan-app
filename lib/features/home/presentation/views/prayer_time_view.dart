import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quran/core/themes/text_style.dart';
import 'package:quran/features/home/presentation/widgets/prayer_time_card.dart';
import 'package:quran/features/home/Cubits/Prayer%20Cubit/prayer_cubit.dart';

class PrayerTimeView extends StatefulWidget {
  const PrayerTimeView({super.key});

  @override
  State<PrayerTimeView> createState() => _PrayerTimeViewState();
}

class _PrayerTimeViewState extends State<PrayerTimeView> {
  DateTime dateTime = DateTime.now(); // Default to current date

  @override
  void initState() {
    super.initState();
    _fetchPrayerTime();
  }

  void _fetchPrayerTime() {
    String formattedDate = DateFormat('dd-MM-yyyy', 'en').format(dateTime);
    context.read<PrayerCubit>().getPrayerTime(date: formattedDate);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('وقت الصلاة')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              DateFormat.yMMMEd().format(dateTime),
              style: MyStyle.title18(context),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _timePicker,
              child: const Text('أختر التاريخ'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<PrayerCubit, PrayerState>(
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
                    return ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        PrayerTimeCard(
                          title: 'الفجر',
                          time: state.prayerTime.fajr ?? '',
                          icon: Icons.wb_twilight,
                          color: Colors.lightBlue,
                        ),
                        PrayerTimeCard(
                          title: 'الضحى',
                          time: state.prayerTime.sunrise ?? '',
                          icon: Icons.wb_sunny_outlined,
                          color: Colors.yellowAccent,
                        ),
                        PrayerTimeCard(
                          title: 'الظهر',
                          time: state.prayerTime.dhuhr ?? '',
                          icon: Icons.wb_sunny,
                          color: Colors.amber,
                        ),
                        PrayerTimeCard(
                          title: 'العصر',
                          time: state.prayerTime.asr ?? '',
                          icon: Icons.wb_cloudy,
                          color: Colors.orange,
                        ),
                        PrayerTimeCard(
                          title: 'المغرب',
                          time: state.prayerTime.maghrib ?? '',
                          icon: Icons.nightlight,
                          color: Colors.deepOrangeAccent,
                        ),
                        PrayerTimeCard(
                          title: 'العشاء',
                          time: state.prayerTime.isha ?? '',
                          icon: Icons.bedtime,
                          color: Colors.indigo,
                        ),
                        // PrayerTimeCard(
                        //   title: 'الغروب',
                        //   time: state.prayerTime.sunset ?? '',
                        //   icon: Icons.nights_stay,
                        //   color: Colors.deepPurpleAccent,
                        // ),
                        // PrayerTimeCard(
                        //   title: 'الأمساك',
                        //   time: state.prayerTime.imsak ?? '',
                        //   icon: Icons.timer,
                        //   color: Colors.teal,
                        // ),
                      ],
                    );
                  }
                  return const Center(child: Text('No Data Available'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
