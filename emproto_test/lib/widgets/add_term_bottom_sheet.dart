// widgets/add_term_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;


class AddTermBottomSheet extends StatefulWidget {
  @override
  _AddTermBottomSheetState createState() => _AddTermBottomSheetState();
}

class _AddTermBottomSheetState extends State<AddTermBottomSheet> {
  TextEditingController _textController = TextEditingController();
  stt.SpeechToText _speech = stt.SpeechToText();
  bool isListening = false;

  void _startListening() async {
    if (!isListening) {
      await _speech.listen(
        onResult: (result) {
          setState(() {
            _textController.text = result.recognizedWords;
          });
        },
        listenFor: Duration(seconds: 10),
      );
    }
  }

  void _stopListening() {
    if (isListening) {
      _speech.stop();
    }
  }

  void _translateAndAdd() async {
    final result = await TranslateLanguage.values;
    // Add your logic to save the translated text to the list
    // ...

    Navigator.pop(context); // Close the bottom sheet
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Term and Condition'),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _startListening();
                  },
                  child: Text('Speak'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    _stopListening();
                  },
                  child: Text('Stop'),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _translateAndAdd();
              },
              child: Text('View in Hindi'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add logic to save the term and condition
                // ...
                Navigator.pop(context); // Close the bottom sheet
              },
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
