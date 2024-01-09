// widgets/add_more_button.dart
import 'package:emproto_test/widgets/add_term_bottom_sheet.dart';
import 'package:flutter/material.dart';

class AddMoreButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) => AddTermBottomSheet(),
        );
      },
      child: Text('Add More'),
    );
  }
}
