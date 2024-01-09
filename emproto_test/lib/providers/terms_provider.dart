// providers/terms_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

import '../data/terms_and_conditions_data.dart';
import '../widgets/terms_and_conditions.dart';

final termsProvider = FutureProvider<List<TermsAndConditions>>((ref) async {
  // Simulate lazy loading of terms and conditions
  await Future.delayed(Duration(seconds: 2));
  return List.from(englishTerms);
});
