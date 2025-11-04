import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../core/themes/light_theme.dart';
import '../../../../../../core/utils/constants.dart';

class DetailsSliverAppBar extends StatelessWidget {
  const DetailsSliverAppBar({
    super.key,
    required this.title,
    required this.type,
    required this.juz,
    required this.engName,
    required this.onTap,
  });

  final String title, type, engName;
  final int juz;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final String revelationType = type == 'Meccan' ? 'مكية' : 'مدنية';

    return SliverAppBar(
      pinned: true,
      floating: true,
      expandedHeight: 150,
      backgroundColor: MyColors.primaryLight,
      automaticallyImplyLeading: false,
      leading: BackButton(onPressed: () => context.pop()),
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final double expandRatio =
              (constraints.maxHeight - kToolbarHeight) / (180 - kToolbarHeight);

          return FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: const EdgeInsets.only(bottom: 10),
            title: AnimatedOpacity(
              opacity: expandRatio < 0.4 ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: Text(
                title,
                style: GoogleFonts.amiri(fontSize: 28, color: MyColors.white),
              ),
            ),
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [MyColors.gradient1, MyColors.gradient2],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                image: DecorationImage(
                  image: AssetImage(Constants.appbar),
                  alignment: Alignment.bottomRight,
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // 🔹 Centered title when expanded
                    const SizedBox(height: 10),
                    Text(
                      title,
                      style: GoogleFonts.amiri(
                        fontSize: 32,
                        color: MyColors.white,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: onTap,
                      icon: const Icon(Icons.info, color: MyColors.white),
                      label: Text(
                        'التفسير',
                        style: GoogleFonts.notoKufiArabic(
                          fontSize: 14,
                          color: MyColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // 🔹 Bottom info row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "الجزء $juz - $revelationType",
                          style: GoogleFonts.notoKufiArabic(
                            fontSize: 15,
                            color: MyColors.white,
                          ),
                        ),
                        Text(
                          engName,
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            color: MyColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
