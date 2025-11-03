import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/surahs_list.dart';
import '../../widgets/search_field.dart';
import '../../widgets/shimmer_list.dart';

import '../../../../../core/themes/light_theme.dart';
import '../../../../../core/utils/helper.dart';
import '../../../Cubits/surah_cuibit/surah_cubit.dart';
import '../../../data/models/surah_model.dart';

class QuranView extends StatefulWidget {
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
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
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
        title: Text(widget.title ?? 'المصحف'),
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
                      child: Divider(thickness: 1, color: MyColors.lightGrey),
                    ),
                itemCount: 20,
              ),
            );
          } else if (state is SurahError) {
            return Center(child: Text(state.message));
          } else if (state is SurahLoaded) {
            final filteredSurahs = _filteredList(
              state.surah,
              _searchQuery ?? '',
            );
            return Column(
              children: [
                if (_isSearch)
                  SearchField(
                    searchController: _searchController,
                    labelText: 'ابحث',
                    focusNode: _focusNode,
                  ),
                if (filteredSurahs.isEmpty)
                  const Expanded(
                    child: Center(child: Text('لا توجد سورة مطابقة')),
                  ),
                if (filteredSurahs.isNotEmpty)
                  SurahsList(
                    surahs: filteredSurahs,
                    isAudio: widget.isAudio,
                    idx: widget.index,
                  ),
              ],
            );
          }
          return const Center(child: Text('No Data'));
        },
      ),
    );
  }

  List<SurahModel> _filteredList(List<SurahModel> list, String query) {
    if (query.isEmpty) return list;

    final normalizedQuery = Helper.normalizeArabic(query).toLowerCase();

    return list.where((l) {
      final name = Helper.normalizeArabic(l.name ?? '').toLowerCase();
      final english = (l.englishName ?? '').toLowerCase();
      final number = l.number.toString();

      return name.contains(normalizedQuery) ||
          english.contains(normalizedQuery) ||
          number.contains(normalizedQuery);
    }).toList();
  }
}
