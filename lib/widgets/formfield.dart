import 'package:crypto_tracker/core/extensions/texttheme_extension.dart';
import 'package:crypto_tracker/core/utils/utils.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppFormField extends StatefulWidget {
  final double? width;
  final double? labelSize;
  final String? hintText;
  final TextEditingController? controller;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool? obscureText;
  final bool? enabled;
  final bool outlined;
  final FormFieldValidator<String>? validator;
  final void Function(String?)? onSaved, onChange;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode, nextFocusNode;
  final VoidCallback? submitAction;
  final bool? enableErrorMessage;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? bordercolor, backgroundColor, labelColor;
  final bool? autofocus;
  final String? label;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? inputFormatters;
  final bool isLoading, readOnly;
  final double borderRadius, labelSpace;
  final String? initialValue;
  final Widget? customLabel;
  final TextStyle? hintStyle;
  final BorderSide? borderSide;
  final double marginBottom;
  final TextCapitalization? textCapitalization;
  final BoxConstraints? constraints;
  final BoxConstraints? suffixIconConstraints;
  final EdgeInsets? contentPadding;

  const AppFormField({
    super.key,
    this.width,
    this.labelSpace = 5,
    this.marginBottom = 20,
    this.onTap,
    this.decoration,
    this.hintStyle,
    this.backgroundColor,
    this.isLoading = false,
    this.readOnly = false,
    this.customLabel,
    this.hintText,
    this.controller,
    this.minLines = 1,
    this.maxLength,
    this.obscureText = false,
    this.enabled = true,
    this.outlined = false,
    this.validator,
    this.borderSide,
    this.onSaved,
    this.onChange,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocusNode,
    this.submitAction,
    this.enableErrorMessage = true,
    this.maxLines = 1,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.prefixIcon,
    this.bordercolor,
    this.autofocus,
    this.label,
    this.inputFormatters,
    this.borderRadius = 4,
    this.initialValue,
    this.labelSize,
    this.labelColor,
    this.textCapitalization,
    this.suffixIconConstraints,
    this.constraints,
    this.contentPadding,
  });

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.customLabel != null) widget.customLabel!,
        if (widget.customLabel == null && widget.label != null)
          Text(
            widget.label!,
            style: textTheme(context).text1Medium,
          ),
        if (widget.customLabel != null || widget.label != null) SizedBox(height: widget.labelSpace),
        Transform.scale(
          scaleY: 1.0,
          child: TextFormField(
            textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
            onTap: widget.onTap,
            readOnly: widget.readOnly,
            initialValue: widget.initialValue,
            textAlign: TextAlign.left,
            inputFormatters: widget.inputFormatters,
            autofocus: widget.autofocus ?? false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            enabled: widget.enabled,
            validator: widget.validator,
            onSaved: widget.onSaved,
            onChanged: widget.onChange,
            style: textTheme(context).text1Regular.copyWith(
                  color: widget.outlined ? appColors(context).onSurface : Colors.black,
                ),
            cursorColor: appColors(context).primary,
            key: widget.key,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            maxLength: widget.maxLength,
            controller: widget.controller,
            obscureText: widget.obscureText!,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            focusNode: widget.focusNode,
            onFieldSubmitted: widget.onFieldSubmitted,
            decoration: widget.decoration ??
                InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: widget.prefixIcon,
                  ),
                  suffixIcon: widget.isLoading
                      ? SizedBox(
                          width: 25,
                          child: SpinKitFadingCircle(
                            size: 24,
                            color: appColors(context).primary,
                          ),
                        )
                      : widget.suffixIcon,
                  filled: true,
                  enabled: false,
                  counterText: '',
                  suffixIconConstraints: widget.suffixIconConstraints,
                  constraints: widget.constraints,
                  contentPadding: widget.contentPadding,
                  prefixIconConstraints: const BoxConstraints(),
                  fillColor: widget.outlined ? Colors.transparent : widget.backgroundColor ?? appColors(context).grey,
                  hintText: widget.hintText,
                  hintStyle: widget.hintStyle ??
                      textTheme(context).text1Regular.copyWith(
                            color: appColors(context).grey,
                          ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: BorderSide(
                      color: appColors(context).error.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: BorderSide(
                      color: appColors(context).error.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: widget.borderSide ??
                        (widget.outlined
                            ? BorderSide(
                                color: appColors(context).grey,
                                style: BorderStyle.solid,
                                width: 1,
                              )
                            : BorderSide.none),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: widget.borderSide ??
                        (widget.outlined
                            ? BorderSide(
                                color: appColors(context).grey,
                                style: BorderStyle.solid,
                                width: 1,
                              )
                            : BorderSide.none),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: widget.borderSide ??
                        (widget.outlined
                            ? BorderSide(
                                color: appColors(context).grey,
                                style: BorderStyle.solid,
                                width: 1,
                              )
                            : BorderSide.none),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: widget.borderSide ??
                        BorderSide(
                          color: appColors(context).primary,
                          width: 1,
                        ),
                  ),
                ),
          ),
        ),
        Spacing.height(widget.marginBottom),
      ],
    );
  }
}

class AppDropdownField extends StatefulWidget {
  final String? hintText;
  final bool outlined;
  final FormFieldValidator<String>? validator;
  final void Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? bordercolor, backgroundColor;
  final String? label;
  final InputDecoration? decoration;
  final bool isLoading;
  final double borderRadius, labelSpace;
  final Widget? customLabel;
  final TextStyle? hintStyle;
  final BorderSide? borderSide;
  final double marginBottom;
  final List<DropdownMenuItem<dynamic>> items;
  final dynamic value;
  final List selectedValues;
  final void Function(dynamic)? onChanged;
  final bool multiple;
  final TextEditingController? controller;
  final bool searchable;
  final bool fullscreen;

  const AppDropdownField(
      {super.key,
      this.labelSpace = 5,
      this.marginBottom = 20,
      this.onTap,
      this.decoration,
      this.hintStyle,
      this.backgroundColor,
      this.isLoading = false,
      this.customLabel,
      this.hintText,
      this.outlined = false,
      this.validator,
      this.borderSide,
      this.suffixIcon,
      this.prefixIcon,
      this.bordercolor,
      this.label,
      this.borderRadius = 4,
      required this.items,
      this.value,
      this.selectedValues = const [],
      this.onChanged,
      this.multiple = false,
      this.searchable = false,
      this.fullscreen = false,
      this.controller});

  @override
  State<AppDropdownField> createState() => _AppDropdownFieldState();
}

class _AppDropdownFieldState extends State<AppDropdownField> {
  late TextEditingController _search;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        items: List.generate(
          widget.items.length,
          (index) => DropdownMenuItem(
            enabled: false,
            value: widget.items[index].value,
            child: StatefulBuilder(
              builder: (context, menuSetState) {
                bool isSelected = widget.items[index].value == widget.value;
                if (widget.multiple) {
                  isSelected = widget.selectedValues.contains(widget.items[index].value);
                }
                return InkWell(
                  onTap: () {
                    if (widget.multiple) {
                      menuSetState(() {
                        isSelected = !isSelected;
                      });
                      widget.onChanged!(widget.items[index].value);
                      return;
                    }
                    widget.onChanged!(widget.items[index].value);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(width: 0.50, color: Color(0xFFE0E0E0))),
                    ),
                    child: Row(
                      children: [
                        Expanded(child: widget.items[index].child),
                        if (isSelected) _selectCheckbox(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        value: widget.value,
        dropdownSearchData: widget.searchable
            ? DropdownSearchData(
                searchInnerWidgetHeight: 80,
                searchController: _search,
                searchMatchFn: (item, searchValue) {
                  if (searchValue.isEmpty) {
                    return true;
                  }
                  return item.value.toString().toLowerCase().contains(searchValue.toLowerCase());
                },
                searchInnerWidget: Padding(
                  padding: const EdgeInsets.all(10),
                  child: AppFormField(
                    marginBottom: 0,
                    backgroundColor: const Color(0xFFF5F5F5),
                    hintText: "Search",
                    controller: _search,
                  ),
                ),
              )
            : null,
        customButton: AppFormField(
          hintText: widget.hintText,
          controller: widget.controller,
          backgroundColor: widget.backgroundColor,
          enabled: false,
          label: widget.label,
          customLabel: widget.customLabel,
          labelSpace: widget.labelSpace,
          onTap: widget.onTap,
          decoration: widget.decoration,
          hintStyle: widget.hintStyle,
          isLoading: widget.isLoading,
          outlined: widget.outlined,
          borderRadius: widget.borderRadius,
          borderSide: widget.borderSide,
          bordercolor: widget.bordercolor,
          marginBottom: widget.marginBottom,
          suffixIcon: widget.suffixIcon ?? const Icon(BIcons.arrow_down_2, color: Colors.black54),
          validator: widget.validator,
          prefixIcon: widget.prefixIcon,
        ),
        onChanged: widget.onChanged,
        barrierColor: const Color(0xFF1E1E1E).withOpacity(0.26),
        dropdownStyleData: DropdownStyleData(
          elevation: 0,
          useRootNavigator: widget.fullscreen,
          maxHeight: MediaQuery.of(context).size.height / 2,
          padding: const EdgeInsets.only(top: 20, bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          offset: const Offset(0, 12),
        ),
        menuItemStyleData: const MenuItemStyleData(height: 55),
      ),
    );
  }

  Widget _selectCheckbox() {
    return Container(
      width: 20,
      height: 20,
      decoration: const ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.86, 0.51),
          end: Alignment(0.86, -0.51),
          colors: [Color.fromARGB(255, 199, 213, 247), Color(0xFF094EFF)],
        ),
        shape: OvalBorder(),
      ),
      child: const Center(
        child: Icon(BIcons.tick_circle, size: 17, color: Colors.white),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _search = TextEditingController();
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }
}
