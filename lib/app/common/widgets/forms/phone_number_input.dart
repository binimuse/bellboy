// ignore_for_file: library_private_types_in_public_api

import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../gen/assets.gen.dart';
import '../../../config/theme/app_text_styles.dart';

class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({
    Key? key,
    required this.hint,
    required this.controller,
    required this.onChanged,
    this.validator,
    required this.focusNode,
    this.autofocus = false,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final FocusNode focusNode;
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

    if (widget.focusNode != null) {
      widget.focusNode.addListener(_onFocusChange);
    }
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          cursorColor: AppColors.primary,
          autofocus: widget.autofocus,
          controller: widget.controller,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
          style: AppTextStyles.titleBold.copyWith(color: AppColors.blackLight),
          validator: widget.validator,
          decoration: InputDecoration(
            // labelText: widget.hint,
            hintText: _isFocused ? null : widget.hint,
            hintStyle: AppTextStyles.titleBold.copyWith(
                color: AppColors.grayLighter, fontSize: AppSizes.font_16),
            labelStyle:
                AppTextStyles.captionBold.copyWith(color: AppColors.grayLight),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            suffixIconConstraints: BoxConstraints(
              maxWidth: AppSizes.icon_size_10,
              maxHeight: AppSizes.icon_size_10,
            ),
            suffixIcon: widget.focusNode.hasFocus && _showClearButton
                ? Bounce(
                    // padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        widget.controller.clear();
                        _showClearButton = false;

                        //  widget.logincontroller!.isPasswordValid(false);
                      });
                    },
                    duration: const Duration(milliseconds: 120),
                    // padding: EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: AppSizes.mp_v_1,
                      ),
                      child: SvgPicture.asset(
                        Assets.icons.cancel,
                        color: AppColors.grayLight,
                        fit: BoxFit.contain,
                      ),
                    ),
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

            if (widget.focusNode != null) {
              // Request focus for the field
              FocusScope.of(context).requestFocus(widget.focusNode);
            }
          },
          focusNode: widget.focusNode,
        ),
      ],
    );
  }
}
