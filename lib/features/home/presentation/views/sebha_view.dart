import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/core/themes/text_style.dart';
import 'package:quran/core/utils/constants.dart';
import 'package:quran/core/themes/light_theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../Cubits/Sebha Cubit/sebha_cubit.dart';

class SebhaView extends StatefulWidget {
  const SebhaView({super.key});

  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text('السبحة')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  width: width * 0.6,
                  height: 80,
                  child: PageView(
                    controller: _pageController,
                    children: [
                      _buildCard('سبحان الله', context),
                      _buildCard('الحمد لله', context),
                      _buildCard('الله اكبر', context),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const JumpingDotEffect(
                    activeDotColor: MyColors.primary,
                    verticalOffset: -20,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 360,
              height: 190,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(Constants.sebha),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 20),
                      BlocBuilder<CounterCubit, int>(
                        builder: (context, count) {
                          return Container(
                            height: 40,
                            width: 110,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: .3),
                                  blurRadius: 1,
                                  spreadRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              color: MyColors.cardBG,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                ' $count',
                                style: GoogleFonts.orbitron(
                                  color: MyColors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 5,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          );
                        },
                      ),
              
                      const SizedBox(height: 20),
              
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              context.read<CounterCubit>().reset();
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.3),
                                    blurRadius: 1,
                                    spreadRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                color: MyColors.cardBG,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Icon(
                                Icons.replay,
                                color: MyColors.primaryDark,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(width: 80),
                        ],
                      ),
              
                          const SizedBox(height: 10),
              
                      // زر الإضافة
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              blurRadius: 1,
                              spreadRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          color: MyColors.cardBG,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: IconButton(
                          onPressed: () {
                            context.read<CounterCubit>().increment();
                          },
                          icon: const Icon(Icons.add, size: 25),
                          color: MyColors.primaryDark,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCard(String title, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [MyColors.gradient1, MyColors.gradient2],
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: MyStyle.title20(context).copyWith(color: Colors.white),
        ),
      ),
    ),
  );
}
