

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';

final speechResultProvider = StateProvider<String?>(((ref) => null));

final canListenProvider = StateProvider<bool>((ref) => false);

final isListeningProvider = StateProvider<bool>((ref) => false);

final sttProvider = FutureProvider.autoDispose<SpeechToText>((ref) async {
  final _stt = SpeechToText();

  final bool _result = await _stt.initialize(onStatus: ((status) {
    print(status);
    if (status == "listening") {
      ref.read(isListeningProvider.notifier).update((state) => true);
    }
    if (status == "notListening") {
      ref.read(isListeningProvider.notifier).update((state) => false);
    }
    if (status == "done") {
      ref.read(isListeningProvider.notifier).update((state) => false);
    }
  }));

  ref.read(canListenProvider.notifier).update((state) => _result);

  ref.onDispose(
        () async {
      await _stt.cancel();
    },
  );

  return _stt;
});
