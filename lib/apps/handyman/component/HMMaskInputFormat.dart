import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaskInputFormatting extends TextInputFormatter {
  final String mask;
  final String saparator;

  MaskInputFormatting({@required this.mask, @required this.saparator}) {
    assert(mask != null);
    assert(saparator != null);
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length && mask[newValue.text.length - 1] == saparator) {
          return TextEditingValue(
            text: '${oldValue.text}$saparator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(offset: newValue.selection.end + 1),
          );
        }
      }
    }
    return newValue;
  }
}
