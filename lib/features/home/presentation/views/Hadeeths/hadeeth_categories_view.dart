import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/themes/text_style.dart';
import '../../../cubit/hadeeth_cubit/hadeeth_cubit.dart';
import '../../../cubit/hadeeth_cubit/hadeeth_state.dart';
import '../../widgets/shimmer_grid.dart';

import '../../../data/models/hadeeths_categories_model.dart';

class HadeethCategoriesView extends StatelessWidget {
  const HadeethCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الأحاديث')),
      body: BlocBuilder<HadeethCubit, HadeethState>(
        builder:
            (_, state) => state.maybeWhen(
              orElse: () => const Center(child: Text('No Data Available')),
              loading: () => const ShimmerGridItem(aspectratio: 1),
              error: (message) => Center(child: Text(message)),
              hadeethsCategoriesLoaded: (hadeethCategoriesList) {
                if (hadeethCategoriesList.isEmpty) {
                  return _buildEmptyState(context);
                }
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    itemCount: hadeethCategoriesList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 1,
                        ),
                    itemBuilder: (context, index) {
                      final category = hadeethCategoriesList[index];
                      return _buildCategoryCard(context, category);
                    },
                  ),
                );
              },
            ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    HadeethsCategoriesModel category,
  ) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      elevation: 3,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          GoRouter.of(
            context,
          ).push('/hadeeths/${category.id}', extra: category.title);
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(milliseconds: 300),
                    child: Text(
                      category.title ?? '',
                      style: MyStyle.title20(
                        context,
                      ).copyWith(fontWeight: FontWeight.bold, height: 1.3),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'عدد الأحاديث: ${category.hadeethsCount ?? 0}',
                  style: MyStyle.title14(context).copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.sentiment_dissatisfied,
            size: 80,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          const SizedBox(height: 16),
          Text(
            'لا توجد تصنيفات بعد!',
            style: MyStyle.title18(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: () {}, child: const Text('إعادة المحاولة')),
        ],
      ),
    );
  }
}
