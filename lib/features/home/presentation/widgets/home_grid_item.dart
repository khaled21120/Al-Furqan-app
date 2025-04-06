import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/themes/light_theme.dart';
import '../../../../core/utils/constants.dart';

class HomeGridItem extends StatelessWidget {
  const HomeGridItem({
    super.key,
    required this.image,
    required this.title,
    required this.height,
    required this.onTap,
  });
  final int image, title, height;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 163,
        height: Constants.height[height], // Dynamic height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [MyColors.gradient2, MyColors.gradient1],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              Text(
                Constants.title[title],
                style: GoogleFonts.notoKufiArabic(
                  fontSize: 17,
                  color: Colors.white, // Ensure text is readable on gradient
                  fontWeight: FontWeight.w600,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                  height: 90,
                  width: 110,
                  child: SvgPicture.asset(Constants.images[image]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
