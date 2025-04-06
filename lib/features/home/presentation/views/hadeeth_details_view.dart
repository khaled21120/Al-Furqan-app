import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/themes/text_style.dart';
import '../../Cubits/Hadeeth Cubit/hadeeth_cubit.dart';

class HadeethDetailsView extends StatelessWidget {
  const HadeethDetailsView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: BlocBuilder<HadeethCubit, HadeethState>(
        builder: (context, state) {
          if (state is HadeethLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HadeethError) {
            return Center(child: Text(state.errMsg));
          } else if (state is HadeethDetailsLoaded) {
            final hadeeth = state.hadeethDetails;
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(hadeeth.title ?? '', style: MyStyle.title25(context)),
                  const SizedBox(height: 16),

                  // Attribution & Grade
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        hadeeth.attribution ?? '',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        hadeeth.grade ?? '',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 30),

                  // Hadeeth Text
                  SelectableText(
                    hadeeth.hadeeth ?? '',
                    textAlign: TextAlign.justify,
                    style: MyStyle.title16(context),
                  ),
                  const SizedBox(height: 40),

                  // Info Button to show more
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        title: const Text(
                          'شرح الحديث',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: SelectableText(
                              hadeeth.explanation ?? '',
                              textAlign: TextAlign.justify,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Hints (points)
                  if (hadeeth.hints != null && hadeeth.hints!.isNotEmpty) ...[
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          title: const Text(
                            'فوائد الحديث',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          children:
                              hadeeth.hints!
                                  .map(
                                    (hint) => ListTile(
                                      leading: Icon(
                                        Icons.check_circle_outline,
                                        size: 20,
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                      ),
                                      title: Text(hint),
                                    ),
                                  )
                                  .toList(),
                        ),
                      ),
                    ),
                  ],

                  // Word Meanings
                  if (hadeeth.wordsMeanings != null &&
                      hadeeth.wordsMeanings!.isNotEmpty) ...[
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          title: const Text(
                            'معاني الكلمات',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          children:
                              hadeeth.wordsMeanings!.map((w) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 12,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "• ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "${w['word']}: ${w['meaning']}",
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                    ),
                  ],

                  // Reference
                  if (hadeeth.reference != null) ...[
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          title: const Text(
                            'المراجع',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: SelectableText(
                                hadeeth.reference!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            );
          }

          return const Center(child: Text('No Data'));
        },
      ),
    );
  }
}
