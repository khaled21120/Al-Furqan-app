import 'package:flutter/material.dart';
import 'package:quran/features/home/presentation/views/Surahs/widgets/surah_item.dart';

import '../../../../../../core/themes/light_theme.dart';
import '../../../../data/models/surah_model.dart';

class SurahsList extends StatelessWidget {
  const SurahsList({
    super.key,
    required this.surahs,
    required this.isAudio,
    required this.idx,
  });
  final List<SurahModel> surahs;
  final bool isAudio;
  final int idx;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView.separated(
          itemBuilder:
              (context, index) => SurahListItem(
                surahModel: surahs[index],
                isAudio: isAudio,
                idx: idx,
              ),
          separatorBuilder:
              (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(thickness: 1, color: MyColors.lightGrey),
              ),
          itemCount: surahs.length,
        ),
      ),
    );
  }
}
