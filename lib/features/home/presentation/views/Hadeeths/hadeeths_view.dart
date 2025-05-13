import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quran/core/themes/text_style.dart';
import 'package:quran/features/home/presentation/widgets/shimmer_list.dart';
import 'package:quran/features/home/Cubits/Hadeeth%20Cubit/hadeeth_cubit.dart';

class HadeethsView extends StatelessWidget {
  const HadeethsView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: BlocBuilder<HadeethCubit, HadeethState>(
        builder: (context, state) {
          if (state is HadeethLoading) {
            return ListView.builder(
              itemCount: 20,
              itemBuilder: (_, idx) {
                return const ShimmerListItem();
              },
            );
          } else if (state is HadeethError) {
            return Center(child: Text(state.errMsg));
          } else if (state is HadeethsLoaded) {
            final hadeeths = state.hadeethslList;
            return ListView.builder(
              itemCount: hadeeths.length,
              itemBuilder:
                  (context, index) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(hadeeths[index].title!),
                      trailing: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {
                          GoRouter.of(context).pushNamed(
                            'hadeethDetails',
                            extra: {'title': title, 'id': hadeeths[index].id},
                          );
                        },
                        child: Text('ٳقرأ', style: MyStyle.title16(context)),
                      ),
                    ),
                  ),
            );
          }

          return const Center(child: Text('No Data'));
        },
      ),
    );
  }
}
