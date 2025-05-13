import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/home/presentation/widgets/shimmer_list.dart';
import 'package:quran/features/home/presentation/views/Surahs/widgets/surah_item.dart';
import '../../../../core/themes/light_theme.dart';
import '../../../../core/themes/text_style.dart';
import '../../../../core/utils/helper.dart';
import '../../Cubits/Surah Cuibit/surah_cubit.dart';
import '../widgets/search_field.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      // ignore: use_build_context_synchronously
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('أبحث')),
      body: BlocBuilder<SurahCubit, SurahState>(
        builder: (context, state) {
          if (state is SurahLoading) {
            return const ShimmerListItem();
          } else if (state is SurahError) {
            return Center(child: Text(state.message));
          } else if (state is SurahLoaded) {
            final surahs = state.surah;
            final search = Helper.normalizeArabic(searchController.text);

            final filtered =
                search.isEmpty
                    ? []
                    : surahs.where((surah) {
                      final name = Helper.removeDiacritics(surah.name ?? '');
                      final english = surah.englishName?.toLowerCase() ?? '';
                      final num = surah.number.toString();
                      final normalizedSearch = Helper.removeDiacritics(search);

                      return name.contains(normalizedSearch) ||
                          english.contains(normalizedSearch.toLowerCase()) ||
                          num.contains(search);
                    }).toList();

            return Column(
              children: [
                SearchField(
                  searchController: searchController,
                  focusNode: _focusNode,
                  onTap: () => setState(() {}),
                ),
                if (search.isEmpty)
                  Expanded(
                    child: Center(
                      child: Text(
                        'ابحث عن سورة',
                        style: MyStyle.title20(context),
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child:
                          filtered.isEmpty
                              ? const Center(child: Text('لا توجد نتائج'))
                              : ListView.separated(
                                itemCount: filtered.length,
                                separatorBuilder:
                                    (_, __) => const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Divider(
                                        thickness: 1,
                                        color: MyColors.lightGrey,
                                      ),
                                    ),
                                itemBuilder: (context, index) {
                                  final surah = filtered[index];
                                  return SurahListItem(
                                    surahModel: surah,
                                    isAudio: false,
                                    idx: 0,
                                  );
                                },
                              ),
                    ),
                  ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
