import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mpcore/mpcore.dart';
import 'package:miniapp_codebase/styles/styles.dart';

/// {@template primary_text_form_field}
/// Primary text form field
/// {@endtemplate}
class PrimaryTextFormField extends StatefulWidget {
  /// {@macro primary_text_form_field}

  const PrimaryTextFormField({
    key,
    required this.controller,
    this.labelText,
    this.labelSuffix,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters = const [],
    this.autofocus = false,
    this.showErrorOnFocus = true,
    this.validator,
    this.obscureText = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.height = 60,
    this.required = false,
    this.enabled = true,
    this.clear = true,
    this.readOnly = false,
    this.onClear,
    this.prefix,
    this.suffix,
    this.alignment = Alignment.center,
    this.onChange,
    this.onTap,
    this.scrollPadding,
  }) : super(key: key);

  /// text form field are
  const PrimaryTextFormField.area({
    key,
    required this.controller,
    this.labelText,
    this.labelSuffix,
    this.hintText,
    this.keyboardType = TextInputType.multiline,
    this.textInputAction = TextInputAction.newline,
    this.inputFormatters = const [],
    this.autofocus = false,
    this.showErrorOnFocus = true,
    this.validator,
    this.obscureText = false,
    this.minLines = 2,
    this.maxLines,
    this.height = 100,
    this.required = false,
    this.enabled = true,
    this.clear = true,
    this.readOnly = false,
    this.onClear,
    this.prefix,
    this.suffix,
    this.alignment = const Alignment(0, -0.64),
    this.onChange,
    this.onTap,
    this.scrollPadding,
  }) : super(key: key);

  /// if controller is null, a private widget controller will be used instead
  final TextEditingController controller;

  /// label text
  final String? labelText;

  /// Label suffix
  final Widget? labelSuffix;

  /// hint text
  final String? hintText;

  /// keyboard input type
  final TextInputType keyboardType;

  /// auto focus
  final bool autofocus;

  /// An action the user has requested the text input control to perform.
  final TextInputAction textInputAction;

  /// Text input formatters
  final List<TextInputFormatter> inputFormatters;

  /// Text input validator
  final String? Function(String)? validator;

  /// show error on focus or not
  final bool showErrorOnFocus;

  /// obscureText
  final bool obscureText;

  /// Text min line
  final int? minLines;

  /// Text max line
  final int? maxLines;

  /// Height text field
  final double height;

  /// Is TextFormField required
  final bool required;

  /// Is enabled
  final bool enabled;

  /// Read only mode
  final bool readOnly;

  /// Has clear button or not
  final bool clear;

  /// onClear callback
  final VoidCallback? onClear;

  /// Prefix
  final Widget? prefix;

  /// Suffix
  final Widget? suffix;

  /// AlignmentGeometry
  final AlignmentGeometry? alignment;

  /// Scroll padding
  final EdgeInsets? scrollPadding;

  /// On text change
  final ValueChanged<String>? onChange;

  /// On tap text field
  final VoidCallback? onTap;

  @override
  State<PrimaryTextFormField> createState() => _PrimaryTextFormFieldState();
}

class _PrimaryTextFormFieldState extends State<PrimaryTextFormField> {
  late TextEditingController _controller;

  bool _hasError = false;
  String? _errorString;
  bool _hasText = false;
  bool _hasFocus = false;

  TextStyle _textFieldStyle() {
    return $style.texts.textField.copyWith(
      color:
          widget.enabled ? $style.colors.neutral400 : $style.colors.neutral200,
    );
  }

  TextStyle _errorTextStyle() {
    return $style.texts.footnote.copyWith(color: $style.colors.error300);
  } // Error text style

  Color _borderColor({
    required bool enabled,
    required bool hasFocus,
    required bool hasError,
  }) {
    return enabled
        ? hasError
            ? $style.colors.error300
            : hasFocus
                ? $style.colors.primary400
                : $style.colors.neutral75
        : $style.colors.neutral50;
  }

  void _listener() {
    setState(() {
      _hasText = _controller.text.isNotEmpty;
      _errorString = widget.validator?.call(_controller.text);
      _hasError = _errorString?.isNotEmpty ?? false;
    });
  }

  @override
  void initState() {
    _controller = widget.controller;
    _hasText = _controller.text.isNotEmpty;
    _controller.addListener(_listener);

    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FocusScope(
            child: Focus(
              onFocusChange: (focus) {
                setState(() => _hasFocus = focus);
              },
              child: Container(
                height: widget.height,
                alignment: widget.alignment,
                decoration: BoxDecoration(
                  color: _backgroundColor(
                    enabled: widget.enabled,
                    hasError: _hasError,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: _borderColor(
                      enabled: widget.enabled,
                      hasFocus: _hasFocus,
                      hasError: _hasError,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: widget.onTap != null
                          ? IgnorePointer(
                              child: _textFormField(),
                            )
                          : _textFormField(),
                    ),
                    if (widget.clear &&
                        _hasText &&
                        !widget.readOnly &&
                        widget.enabled)
                      _buildClearTextButton(),
                    if (widget.suffix != null) widget.suffix!,
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: _hasError,
            child: Container(
              padding: EdgeInsets.only(
                left: $style.insets.sm,
                top: $style.insets.xxs,
              ),
              child: Text(
                _errorString ?? '',
                style: _errorTextStyle(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClearTextButton() {
    return GestureDetector(
      onTap:() {
          _controller.clear();
          setState(() {
            _hasText = false;
          });
          widget.onClear?.call();
        },
      child: Container(
        padding: EdgeInsets.fromLTRB(
          widget.suffix == null ? 12 : 0,
          0,
          widget.suffix == null ? 12 : 0,
          0,
        ),
        child: Image.asset(
          'assets/icons/ic_clear.png',
          width: 24,
          height: 24,
        ),
      ),
    );
  }

  Widget _textFormField() {
    return MPEditableText(
      onChanged: (value) {
        widget.onChange?.call(value);
      },
      focusNode: FocusNode(),
      // enabled: widget.enabled,
      readOnly: widget.readOnly,
      controller: _controller,
      style: _textFieldStyle(),
      autofocus: widget.autofocus,
      obscureText: widget.obscureText,
      cursorColor: $style.colors.primary400,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      inputFormatters: widget.inputFormatters,
      maxLines: widget.maxLines ?? 1,
      minLines: widget.minLines,
      scrollPadding: widget.scrollPadding ?? const EdgeInsets.only(bottom: 116),
      // validator: (value) {
      //   final _errorString = widget.validator?.call(_controller.text);
      //   setState(() {
      //     this._errorString = _errorString;
      //     if (widget.validator?.call(_controller.text)?.isNotEmpty ?? false) {
      //       _hasError = true;
      //     } else {
      //       _hasError = false;
      //     }
      //   });
      //   return _hasError ? '' : null;
      // },
      // decoration: InputDecoration(
      //   contentPadding: const EdgeInsets.symmetric(
      //     vertical: 2,
      //     horizontal: 16,
      //   ),
      //   label: _label(),
      //   hintText: widget.hintText,
      //   hintStyle: $style.texts.textField.copyWith(
      //     color: $style.colors.neutral100,
      //   ),
      //   border: InputBorder.none,
      //   errorBorder: InputBorder.none,
      //   errorStyle: const TextStyle(height: 0),
      //   focusedErrorBorder: InputBorder.none,
      //   disabledBorder: InputBorder.none,
      //   focusedBorder: InputBorder.none,
      //   floatingLabelBehavior: FloatingLabelBehavior.auto,
      // ),
    );
  }

  Color _backgroundColor({required bool enabled, required bool hasError}) {
    return enabled
        ? hasError
            ? $style.colors.error50
            : $style.colors.neutral0
        : $style.colors.neutral50;
  }

  Widget? _label() {
    if (widget.labelText == null) {
      return null;
    }

    if (widget.labelSuffix != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Label(
            labelText: widget.labelText!,
            enabled: widget.enabled,
            hasFocus: _hasFocus,
            hasError: _hasError,
            hasText: _controller.text.isNotEmpty,
            required: widget.required,
          ),
          if (_controller.text.isNotEmpty) const SizedBox(width: 12),
          if (_controller.text.isNotEmpty) widget.labelSuffix!,
        ],
      );
    }

    return _Label(
      labelText: widget.labelText!,
      enabled: widget.enabled,
      hasFocus: _hasFocus,
      hasError: _hasError,
      hasText: _controller.text.isNotEmpty,
      required: widget.required,
    );
  }
}

class _Label extends StatelessWidget {
  const _Label({
    required this.labelText,
    required this.enabled,
    required this.hasFocus,
    required this.hasError,
    required this.hasText,
    this.required = false,
  });

  final String labelText;

  final bool enabled;
  final bool hasFocus;
  final bool hasError;
  final bool hasText;

  final bool required;

  TextStyle _labelTextStyle({
    required bool hasText,
    required bool hasFocus,
    required bool hasError,
    required bool enabled,
  }) {
    return hasFocus
        ? $style.texts.textFieldBold.copyWith(
            color:
                !hasError ? $style.colors.primary400 : $style.colors.error400,
          )
        : hasText
            ? $style.texts.textFieldBold.copyWith(
                color: enabled
                    ? !hasError
                        ? $style.colors.neutral400
                        : $style.colors.error400
                    : $style.colors.neutral200,
              )
            : $style.texts.textField.copyWith(
                color: $style.colors.neutral100,
              );
  }

  @override
  Widget build(BuildContext context) {
    final labelTextStyle = _labelTextStyle(
      hasText: hasText,
      hasFocus: hasFocus,
      hasError: hasError,
      enabled: enabled,
    );

    final requiredTextStyle = labelTextStyle.copyWith(
      color: $style.colors.error300,
    );

    return RichText(
      text: TextSpan(
        style: labelTextStyle,
        children: <TextSpan>[
          TextSpan(text: labelText),
          if (required)
            TextSpan(
              text: ' *',
              style: requiredTextStyle,
            ),
        ],
      ),
    );
  }
}
