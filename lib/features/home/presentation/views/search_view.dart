import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'surahs/widgets/surah_item.dart';
import '../../../../core/themes/light_theme.dart';
import '../../../../core/themes/text_style.dart';
import '../../../../core/utils/helper.dart';
import '../../Cubits/surah_cuibit/surah_cubit.dart';
import '../widgets/search_field.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<dynamic> filteredSurahs = [];
  bool hasSearchText = false;

  @override
  void initState() {
    super.initState();

    // Add listener to search controller
    searchController.addListener(_onSearchChanged);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  void _onSearchChanged() {
    final state = context.read<SurahCubit>().state;

    if (state is SurahLoaded) {
      final surahs = state.surah;
      final search = Helper.normalizeArabic(searchController.text);

      setState(() {
        hasSearchText = search.isNotEmpty;

        if (hasSearchText) {
          filteredSurahs =
              surahs.where((surah) {
                final name = Helper.removeDiacritics(surah.name ?? '');
                final english = surah.englishName?.toLowerCase() ?? '';
                final num = surah.number.toString();
                final normalizedSearch = Helper.removeDiacritics(search);

                return name.contains(normalizedSearch) ||
                    english.contains(normalizedSearch.toLowerCase()) ||
                    num.contains(search);
              }).toList();
        } else {
          filteredSurahs = [];
        }
      });
    }
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
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
            return const Center(child: CircularProgressIndicator());
          } else if (state is SurahError) {
            return Center(child: Text(state.message));
          } else if (state is SurahLoaded) {
            if (hasSearchText && filteredSurahs.isEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _onSearchChanged();
              });
            }

            return Column(
              children: [
                SearchField(
                  searchController: searchController,
                  labelText: 'ابحث',
                  focusNode: _focusNode,
                ),
                if (!hasSearchText)
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
                          filteredSurahs.isEmpty
                              ? const Center(child: Text('لا توجد نتائج'))
                              : ListView.separated(
                                itemCount: filteredSurahs.length,
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
                                  final surah = filteredSurahs[index];
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
