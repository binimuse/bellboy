// ignore_for_file: library_private_types_in_public_api

import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../config/theme/app_text_styles.dart';

class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({
    Key? key,
    required this.hint,
    required this.controller,
    required this.onChanged,
    this.validator,
    this.focusNode,
    this.autofocus = false,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final bool autofocus;

  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  bool _showClearButton = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        _showClearButton = widget.controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          autofocus: widget.autofocus,
          controller: widget.controller,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
          style: AppTextStyles.titleBold.copyWith(color: AppColors.blackLight),
          validator: widget.validator,
          decoration: InputDecoration(
            labelText: widget.hint,
            hintText: _isFocused ? null : widget.hint,
            hintStyle:
                AppTextStyles.titleBold.copyWith(color: AppColors.grayLighter),
            labelStyle:
                AppTextStyles.captionBold.copyWith(color: AppColors.grayLight),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: _showClearButton
                ? IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: AppColors.grayLight,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.controller.clear();
                        _showClearButton = false;
                      });
                    },
                  )
                : null,
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.grayLight,
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.grayLight,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.grayLight,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.black,
              ),
            ),
          ),
          onChanged: (value) {
            setState(() {
              _isFocused = value.isNotEmpty;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          onTap: () {
            setState(() {
              _isFocused = true;
            });
          },
          focusNode: widget.focusNode,
        ),
      ],
    );
  }
}
