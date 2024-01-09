// widgets/terms_list.dart
import 'package:emproto_test/widgets/add_more_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'term_card.dart';
import '../providers/terms_provider.dart';

class TermsList extends ConsumerWidget {
  const TermsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final termsAsyncValue = ref.watch(termsProvider);

    return termsAsyncValue.when(
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) => Text('Error: $error'),
      data: (terms) {
        return ListView.builder(
          itemCount: terms.length + 1,
          itemBuilder: (context, index) {
            if (index == terms.length) {
              return AddMoreButton();
            }
            return TermCard(terms[index]);
          },
        );
      },
    );
  }
}
