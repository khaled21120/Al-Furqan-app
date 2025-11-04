import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utils/helper.dart';
import '../../../../../core/themes/text_style.dart';
import '../../../cubit/azkar_cubit/azkar_cubit.dart';
import '../../../cubit/azkar_cubit/azkar_state.dart';

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
          builder:
              (context, state) => state.maybeWhen(
                orElse: () => const Center(child: Text('No Data Available')),
                loading:
                    () => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                error: (message) => Center(child: Text(message)),
                loaded:
                    (azkarList) => ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: azkarList.length,
                      separatorBuilder:
                          (_, index) => const SizedBox(height: 12),
                      itemBuilder: (_, index) {
                        final azkar = azkarList[index];
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
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                ),
                                const Divider(thickness: 1, color: Colors.grey),

                                // Count
                                if (azkar.count != null &&
                                    azkar.count!.isNotEmpty)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withValues(alpha: 0.1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      'عدد المرات: ${Helper.convertNumberToArabic(int.parse(azkar.count!))}',
                                      style: MyStyle.title16(context).copyWith(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.primary,
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
                    ),
              ),
        ),
      ),
    );
  }
}
