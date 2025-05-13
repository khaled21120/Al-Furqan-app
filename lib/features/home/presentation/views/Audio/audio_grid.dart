import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran/core/utils/constants.dart';
import '../../../../../core/themes/light_theme.dart';
import '../../widgets/home_button.dart';

class AudioGrid extends StatelessWidget {
  const AudioGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("أختر القارئ")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.9,
          ),
          itemCount: Constants.recite.length,
          itemBuilder: (context, idx) {
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      Constants.recite[idx].imgURL,
                    ),
                    fit: BoxFit.cover,
                  ),
                  gradient: const LinearGradient(
                    colors: [MyColors.gradient1, MyColors.gradient2],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 15,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        color: Colors.black26,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            Constants.recite[idx].name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: MyColors.white,
                            ),
                          ),
                        ),
                      ),
                      HomeButton(
                        title: 'أستمع',
                        onPressed: () {
                          GoRouter.of(context).pushNamed(
                            'quranView',
                            extra: {
                              'isAudio': true,
                              'index': idx,
                              'title': Constants.recite[idx].name,
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
