import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/themes/text_style.dart';

import '../../../../../core/themes/light_theme.dart';
import '../../../../../core/utils/helper.dart';
import '../../../cubit/translation_cubit/translation_cubit.dart';
import '../../../cubit/translation_cubit/translation_state.dart';
import '../../../data/models/translation_model.dart';
import '../../widgets/search_field.dart';

class SurahTranslationView extends StatefulWidget {
  const SurahTranslationView({super.key, required this.surahName});
  final String surahName;

  @override
  State<SurahTranslationView> createState() => _SurahTranslationViewState();
}

class _SurahTranslationViewState extends State<SurahTranslationView> {
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();
  bool _isSearch = false;
  String? _searchQuery;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 250), () {
      setState(() {
        _searchQuery = _searchController.text.trim();
      });
    });
  }

  void _clearSearch() {
    _debounceTimer?.cancel();
    _searchController.clear();
    setState(() => _searchQuery = '');
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surahName, style: GoogleFonts.amiri(fontSize: 25)),
        actions: [
          IconButton(
            icon: Icon(_isSearch ? Icons.close : Icons.search),
            onPressed: () {
              if (_isSearch) _clearSearch();
              setState(() {
                _isSearch = !_isSearch;
              });
              if (_isSearch) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  FocusScope.of(context).requestFocus(_focusNode);
                });
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<TranslationCubit, TranslationState>(
        builder:
            (context, state) => state.maybeWhen(
              orElse: () => const Center(child: Text('No Data Available')),
              loading:
                  () =>
                      const Center(child: CircularProgressIndicator.adaptive()),
              error: (message) => Center(child: Text(message)),
              loaded: (translationList) {
                final filterdList = _filteredList(
                  translationList,
                  _searchQuery ?? '',
                );
                return Column(
                  children: [
                    if (_isSearch)
                      SearchField(
                        searchController: _searchController,
                        keyboardType: TextInputType.number,
                        labelText: 'ادخل رقم الاية',
                        focusNode: _focusNode,
                      ),
                    if (filterdList.isEmpty)
                      const Expanded(
                        child: Center(
                          child: Text(
                            'لا يوجد تفسير مطابق لرقم الاية الذي قمت بادخاله. تأكد من رقم الاية',
                          ),
                        ),
                      ),
                    if (filterdList.isNotEmpty)
                      Expanded(
                        child: ListView.builder(
                          itemCount: filterdList.length,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          itemBuilder: (context, index) {
                            final translation = filterdList[index];
                            return Card(
                              elevation: 3,
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  spacing: 10,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Ayah Number
                                    Text(
                                      'الآية: ${translation.aya}',
                                      style: MyStyle.splash14(context),
                                    ),

                                    // Arabic Text
                                    Text(
                                      translation.arabicText!,
                                      style: GoogleFonts.amiri(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      color: MyColors.lightGrey,
                                    ),

                                    // Translation
                                    Text(
                                      translation.translation!,
                                      textAlign: TextAlign.justify,
                                      style: MyStyle.title18(context),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                );
              },
            ),
      ),
    );
  }

  List<SurahTranslationModel> _filteredList(
    List<SurahTranslationModel> list,
    String query,
  ) {
    if (query.isEmpty) return list;
    final normalizedQuery = Helper.removeDiacritics(query).toLowerCase();
    return list
        .where(
          (l) =>
              (l.aya?.contains(query) ?? false) ||
              (l.arabicText?.contains(normalizedQuery) ?? false),
        )
        .toList();
  }
}
