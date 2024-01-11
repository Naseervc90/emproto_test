import 'package:emproto_test/data/terms_and_conditions_data.dart';
import 'package:emproto_test/emproto_test_2/bloc/post_bloc.dart';
import 'package:emproto_test/emproto_test_2/data/repositories/post_repository.dart';
import 'package:emproto_test/emproto_test_2/ui/pages/post_list_page.dart';
import 'package:emproto_test/emproto_test_3/counter_stream.dart';
import 'package:emproto_test/widgets/terms_and_conditions.dart';
import 'package:emproto_test/widgets/terms_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

void main() {
  //runApp(ProviderScope(child: MyApp()));
  // runApp(PostApp());
  runApp(CounterStreamApp());
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
          title: const Text('Terms and Conditions'),
        ),
        body: const TermsList(),
      ),
    );
  }
}

class PostApp extends StatelessWidget {
  const PostApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PostBloc(
              postRepository: PostRepository(apiClient: http.Client()),
            )..add(FetchPosts()),
          ),
        ],
        child: PostPage(),
      ),
    );
  }
}

class CounterStreamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterStream(),
    );
  }
}
