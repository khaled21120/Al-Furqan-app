import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/core/utils/helper.dart';

import '../../../../core/themes/light_theme.dart';
import '../../../../core/utils/constants.dart';
import '../../data/models/surah_model.dart';
import '../../Cubits/Last Read Cubit/last_read_cubit.dart';
import 'home_button.dart';

class LastRead extends StatelessWidget {
  const LastRead({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LastReadCubit, SurahModel?>(
      builder: (context, lastRead) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.only(top: 20, left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [MyColors.gradient1, MyColors.gradient2],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(Constants.quran),
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'أخر قراءة',
                      style: GoogleFonts.tajawal(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: MyColors.white,
                      ),
                    ),
                    Text(
                      lastRead?.name ?? 'لم تقرأ بعد',
                      style: GoogleFonts.amiri(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: MyColors.white,
                      ),
                    ),
                    HomeButton(
                      title: 'تابع',
                      onPressed: () async {
                        if (lastRead != null) {
                          await GoRouter.of(
                            context,
                          ).pushNamed('surahDetailsView', extra: lastRead);
                        } else {
                          Helper.showSnackBar(
                            context: context,
                            message: 'لا يوجد قراءات',
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
