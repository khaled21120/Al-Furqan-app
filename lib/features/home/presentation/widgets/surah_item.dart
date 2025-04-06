import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/core/themes/text_style.dart';
import 'package:quran/core/utils/constants.dart';
import 'package:quran/core/utils/helper.dart';
import 'package:quran/features/home/data/models/surah_model.dart';
import 'package:quran/features/home/Cubits/Last%20Read%20Cubit/last_read_cubit.dart';

import '../../../../core/themes/light_theme.dart';

class SurahListItem extends StatelessWidget {
  const SurahListItem({
    super.key,
    required this.surahModel,
    required this.isAudio,
    required this.idx,
  });
  final SurahModel surahModel;
  final bool isAudio;
  final int idx;

  @override
  Widget build(BuildContext context) {
    String arabicName;
    List<String> nameParts = surahModel.name!.split(' ');

    if (nameParts.length == 3) {
      arabicName = '${nameParts[1]} ${nameParts[2]}';
    } else {
      arabicName = nameParts[1];
    }

    return ListTile(
      onTap: () {
        if (isAudio) {
          GoRouter.of(context).pushNamed(
            'audioPlayer',
            extra: {
              'surah': surahModel,
              'index': idx,
              'name': Constants.recite[idx].endPoint,
            },
          );
        } else {
          Helper.saveLastReadToPrefs(surahModel);
          context.read<LastReadCubit>().loadLastRead();
          GoRouter.of(context).pushNamed('surahDetailsView', extra: surahModel);
        }
      },
      leading: SizedBox(
        height: 36, // Match the image size
        width: 37, // Match the image size
        child: Stack(
          alignment: Alignment.center, // Ensures everything is centered
          children: [
            SvgPicture.asset(Constants.star),
            Text(
              surahModel.number!.toString(),
              style: MyStyle.title14(context),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      title: Text(
        arabicName,
        style: GoogleFonts.amiri(fontSize: 20, fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        'عدد الأيات: ${surahModel.numberOfAyahs}',
        style: MyStyle.title12(context),
      ),
      trailing: Text(
        surahModel.englishName!,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: MyColors.primary,
        ),
      ),
    );
  }
}
