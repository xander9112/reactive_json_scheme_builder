import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

// class NumValueAccessor extends ControlValueAccessor<num, String> {
//   @override
//   num? viewToModelValue(String? viewValue) {
//     if (viewValue == null || viewValue.trim().isEmpty) return null;

//     return num.tryParse(
//       viewValue.replaceAll(RegExp(r'\s+'), '').replaceAll(',', '.'),
//     );
//   }

//   @override
//   String? modelToViewValue(num? modelValue) {
//     if (modelValue == null) return '';

//     final formatter = NumberFormat('#,##0.###', 'en_US');

//     return formatter.format(modelValue);
//   }
// }

class NumValueAccessor extends ControlValueAccessor<num, String> {
  NumValueAccessor({
    String locale = 'en_US',
    bool allowFractions = true,
  })  : _numberFormat = NumberFormat.decimalPattern(locale),
        _allowFractions = allowFractions {
    _numberFormat.minimumFractionDigits = 0;
    _numberFormat.maximumFractionDigits = _allowFractions ? 10 : 0;
  }
  final NumberFormat _numberFormat;
  final bool _allowFractions;

  @override
  String modelToViewValue(num? modelValue) {
    if (modelValue == null) return '';

    // Для целых чисел используем форматирование без дробной части
    if (modelValue is int && !_allowFractions) {
      return _numberFormat.format(modelValue);
    }

    // Для всех случаев конвертируем в double
    return _numberFormat.format(modelValue.toDouble());
  }

  @override
  num? viewToModelValue(String? viewValue) {
    if (viewValue == null || viewValue.isEmpty) return null;

    // Нормализуем строку (удаляем разделители тысяч, заменяем разделитель на точку)
    final normalized = viewValue
        .replaceAll(_numberFormat.symbols.GROUP_SEP, '')
        .replaceAll(_numberFormat.symbols.DECIMAL_SEP, '.');

    // Пробуем парсить как num (работает и для int, и для double)
    return num.tryParse(normalized);
  }
}
