import 'package:emproto_test/data/terms_and_conditions_data.dart';
import 'package:emproto_test/widgets/terms_and_conditions.dart';
import 'package:emproto_test/widgets/terms_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



void main() {
  runApp(ProviderScope(child: MyApp()));
}

final termsProvider = FutureProvider<List<TermsAndConditions>>((ref) async {
  // Simulate lazy loading of terms and conditions
  await Future.delayed(const Duration(seconds: 2));
  return List.from(englishTerms);
});

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Terms and Conditions'),
        ),
        body: TermsList(),
      ),
    );
  }
}

