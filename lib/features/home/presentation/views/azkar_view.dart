import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/core/utils/helper.dart';
import 'package:quran/features/home/Cubits/Azkar%20Cubit/azkar_cubit.dart';
import '../../../../core/themes/text_style.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key, required this.title, required this.id});
  final String title, id;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: GoogleFonts.tajawal(fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<AzkarCubit, AzkarState>(
          builder: (context, state) {
            if (state is AzkarLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AzkarError) {
              return Center(child: Text(state.message));
            } else if (state is AzkarLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: state.azkarList.length,
                separatorBuilder:
                    (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final azkar = state.azkarList[index];
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20,
                      ),
                      child: Column(
                        spacing: 12,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Content
                          Text(
                            azkar.content ?? '',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.tajawal(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          const Divider(thickness: 1, color: Colors.grey),

                          // Count
                          if (azkar.count != null && azkar.count!.isNotEmpty)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).colorScheme.primary.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'عدد المرات: ${Helper.convertNumberToArabic(int.parse(azkar.count!))}',
                                style: MyStyle.title16(context).copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),

                          // Description
                          if (azkar.description != null &&
                              azkar.description!.isNotEmpty)
                            Text(
                              azkar.description!,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.tajawal(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
