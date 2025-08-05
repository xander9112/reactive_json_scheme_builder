import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class JsonSchemeFormControl<T> extends FormControl<T> {
  JsonSchemeFormControl({
    super.value,
    super.validators,
    super.asyncValidators,
    super.asyncValidatorsDebounceTime,
    super.touched,
    super.disabled,
    bool visible = true,
  })  : _visible = visible,
        super();

  bool _visible;

  bool get visible => _visible;

  set visible(bool value) {
    _visible = value;
    if (_visible) {
      markAsEnabled();
    } else {
      markAsDisabled();
    }
  }

  static JsonSchemeFormControl<T> fromFormControl<T>(FormControl<T> control) =>
      control as JsonSchemeFormControl<T>;
}
