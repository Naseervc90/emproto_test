// widgets/term_card.dart
import 'package:emproto_test/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';


class TermCard extends StatefulWidget {
  final TermsAndConditions term;

  TermCard(this.term);

  @override
  _TermCardState createState() => _TermCardState();
}

class _TermCardState extends State<TermCard> {

  bool isHindiVisible = false;
  String hindiTranslation = '';

  final _onDeviceTranslator = OnDeviceTranslator(
      sourceLanguage: TranslateLanguage.english, targetLanguage: TranslateLanguage.hindi);


  Future<void> _translateToHindi(String text) async {
    _onDeviceTranslator.translateText(text).then((result) {
      setState(() {
        hindiTranslation = result;
      });
    });


    final result = await _onDeviceTranslator.translateText(text);
    setState(() {
      hindiTranslation = result;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          ListTile(
            title: Text(widget.term.value),
            subtitle: isHindiVisible ? Text(hindiTranslation) : null,
            trailing: ElevatedButton(
              onPressed: () {
                setState(() {
                  isHindiVisible = !isHindiVisible;
                  if (isHindiVisible) {
                    _translateToHindi(widget.term.value);
                  }
                });
              },
              child: Text(isHindiVisible ? 'Hide Hindi' : 'Read In Hindi'),
            ),
          ),
        ],
      ),
    );
  }
}
