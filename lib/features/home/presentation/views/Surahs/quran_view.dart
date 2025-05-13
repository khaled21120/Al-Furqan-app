import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/home/presentation/views/Surahs/widgets/surahs_list.dart';
import 'package:quran/features/home/presentation/widgets/shimmer_list.dart';

import '../../../../../core/themes/light_theme.dart';
import '../../../Cubits/Surah Cuibit/surah_cubit.dart';

class QuranView extends StatelessWidget {
  const QuranView({
    super.key,
    required this.isAudio,
    required this.index,
    required this.title,
  });
  final bool isAudio;
  final int index;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title ?? 'المصحف')),
      body: BlocBuilder<SurahCubit, SurahState>(
        builder: (context, state) {
          if (state is SurahLoading) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ListView.separated(
                itemBuilder: (context, index) => const ShimmerListItem(),
                separatorBuilder:
                    (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Divider(
                        thickness: 1,
                        color: MyColors.lightGrey,
                      ),
                    ),
                itemCount: 20,
              ),
            );
          } else if (state is SurahError) {
            return Center(child: Text(state.message));
          } else if (state is SurahLoaded) {
            return Column(
              children: [
                SurahsList(surahs: state.surah, isAudio: isAudio, idx: index),
              ],
            );
          }
          return const Center(child: Text('No Data'));
        },
      ),
    );
  }
}
