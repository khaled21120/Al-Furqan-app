import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../core/themes/text_style.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/utils/helper.dart';
import '../../../../data/models/surah_model.dart';
import '../../../../Cubits/last_read_cubit/last_read_cubit.dart';

import '../../../../../../core/themes/light_theme.dart';

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
              'endPoint': Constants.recite[idx].endPoint,
              'name': Constants.recite[idx].name,
            },
          );
        } else {
          Helper.saveLastReadToPrefs(surahModel);
          context.read<LastReadCubit>().loadLastRead();
          GoRouter.of(context).push('/surahDetailsView/${surahModel.number}');
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
