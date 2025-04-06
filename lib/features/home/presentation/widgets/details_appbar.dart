import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/core/utils/helper.dart';

import '../../../../core/themes/light_theme.dart';
import '../../../../core/utils/constants.dart';

class DetailsAppbar extends StatelessWidget {
  const DetailsAppbar({
    super.key,
    required this.title,
    required this.type,
    required this.juz,
    required this.hizbQuarter,
    required this.engName,
    required this.onTap,
  });
  final String title, type, engName;
  final int juz, hizbQuarter;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final String revelationType = type == 'Meccan' ? 'مكية' : 'مدنية';
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 55, bottom: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [MyColors.gradient1, MyColors.gradient2],
        ),
        image: DecorationImage(
          image: AssetImage(Constants.appbar),
          alignment: Alignment.bottomRight,
        ),
      ),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackButton(
                onPressed: () => GoRouter.of(context).pop(),
                color: MyColors.white,
              ),
              Text(
                title,
                style: GoogleFonts.amiri(fontSize: 30, color: MyColors.white),
              ),
              ElevatedButton(
                style: IconButton.styleFrom(
                  minimumSize: const Size(40, 40),
                  backgroundColor: MyColors.primaryLight,
                  elevation: 5,
                ),
                onPressed: () {
                  Helper.showAlert(
                    context: context,
                    title: 'معلومات عن السورة',
                    onTap: onTap,
                  );
                },
                child: const Icon(FontAwesomeIcons.info, color: MyColors.white),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "الجزء $juz - الحزب $hizbQuarter - $revelationType",
                style: GoogleFonts.notoKufiArabic(
                  fontSize: 15,
                  color: MyColors.white,
                ),
              ),
              Text(
                engName,
                style: GoogleFonts.poppins(fontSize: 16, color: MyColors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
