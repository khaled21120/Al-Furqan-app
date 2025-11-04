import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/themes/text_style.dart';
import '../../../cubit/hadeeth_cubit/hadeeth_cubit.dart';
import '../../../cubit/hadeeth_cubit/hadeeth_state.dart';
import '../../widgets/shimmer_list.dart';

class HadeethsView extends StatelessWidget {
  const HadeethsView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: BlocBuilder<HadeethCubit, HadeethState>(
        builder:
            (context, state) => state.maybeWhen(
              orElse: () => const Center(child: Text('No Data Available')),
              loading:
                  () => ListView.builder(
                    itemCount: 20,
                    itemBuilder: (_, idx) {
                      return const ShimmerListItem();
                    },
                  ),
              error: (errMsg) => Center(child: Text(errMsg)),
              loaded:
                  (hadeethsList) => ListView.builder(
                    itemCount: hadeethsList.length,
                    itemBuilder:
                        (context, index) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: ListTile(
                            title: Text(hadeethsList[index].title!),
                            trailing: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                              onPressed:
                                  () => GoRouter.of(context).push(
                                    '/hadeethDetails/${hadeethsList[index].id}',
                                    extra: title,
                                  ),
                              child: Text(
                                'ٳقرأ',
                                style: MyStyle.title16(context),
                              ),
                            ),
                          ),
                        ),
                  ),
            ),
      ),
    );
  }
}
