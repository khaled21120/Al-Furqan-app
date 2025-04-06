import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/core/themes/light_theme.dart';
import 'package:quran/core/utils/constants.dart';

import '../widgets/social_buttons.dart';

class AboutMeView extends StatelessWidget {
  const AboutMeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'عن التطبيق',
          style: GoogleFonts.tajawal(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: MyColors.white,
                    child: Image.asset(
                      Constants.logo,
                      fit: BoxFit.contain,
                    ), // optional
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'تطبيق الفرقان',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.tajawal(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    Constants.appDesc,
                    style: GoogleFonts.tajawal(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).hintColor,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Column(
                children: [
                  Text(
                    'تم التطوير بواسطة:',
                    style: GoogleFonts.tajawal(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'خالد جمال - مهندس برمجيات ',
                    style: GoogleFonts.tajawal(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  const SocialButtonsRow(),
                  const SizedBox(height: 10),

                  Center(
                    child: Text(
                      'الإصدار 1.0.0',
                      style: GoogleFonts.tajawal(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
