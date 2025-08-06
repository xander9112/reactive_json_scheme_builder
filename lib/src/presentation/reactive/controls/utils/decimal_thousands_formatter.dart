import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

// class DecimalThousandsFormatter extends TextInputFormatter {
//   final NumberFormat _formatter = NumberFormat('#,##0.###', 'en_US');

//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue,
//     TextEditingValue newValue,
//   ) {
//     String raw = newValue.text.replaceAll(RegExp('[^0-9.,]'), '');

//     // Приводим , к . чтобы унифицировать ввод
//     raw = raw.replaceAll(',', '.');

//     // Разделяем на целую и дробную часть
//     final parts = raw.split('.');

//     final intPart = parts[0];
//     final decPart = parts.length > 1 ? parts[1] : null;

//     // Убираем ведущие нули
//     final cleanedInt = intPart.replaceFirst(RegExp(r'^0+(?!$)'), '');

//     String formattedInt = '';
//     if (cleanedInt.isNotEmpty) {
//       formattedInt =
//           NumberFormat('#,###', 'en_US').format(num.parse(cleanedInt));
//     }

//     String formatted = formattedInt;
//     if (decPart != null) {
//       formatted += '.$decPart';
//     }

//     return TextEditingValue(
//       text: formatted,
//       selection: TextSelection.collapsed(offset: formatted.length),
//     );
//   }
// }

class DecimalThousandsFormatter extends TextInputFormatter {
  DecimalThousandsFormatter({String locale = 'en_US'})
      : _numberFormat = NumberFormat.decimalPattern(locale);
  final NumberFormat _numberFormat;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;

    // Сохраняем позицию курсора
    final selectionIndex = newValue.selection.end;

    // Удаляем все нецифровые символы кроме разделителей и минуса
    final cleaned = newValue.text.replaceAll(RegExp(r'[^\d.,-]'), '');

    // Парсим число
    final parsed = num.tryParse(
      cleaned
          .replaceAll(_numberFormat.symbols.GROUP_SEP, '')
          .replaceAll(_numberFormat.symbols.DECIMAL_SEP, '.'),
    );

    if (parsed == null) return oldValue;

    // Форматируем обратно
    final formatted = _numberFormat.format(parsed.toDouble());

    // Корректируем позицию курсора
    var newPosition =
        selectionIndex + (formatted.length - newValue.text.length);
    newPosition = newPosition.clamp(0, formatted.length);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: newPosition),
    );
  }
}
