import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/app/modules/login/controllers/login_controller.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextInputLogin extends StatefulWidget {
  const TextInputLogin({
    Key? key,
    required this.hint,
    this.isPassword = false,
    required this.controller,
    this.logincontroller,
    this.validator,
    required this.autofocus,
    required this.focusNode,
    this.onChanged, // Added onChanged callback
  }) : super(key: key);

  final String hint;
  final bool isPassword;
  final bool autofocus;
  final TextEditingController controller;
  final LoginController? logincontroller;
  final String? Function(String?)? validator;
  final FocusNode focusNode;
  final void Function(String)? onChanged; // Callback when the text changes

  @override
  State<TextInputLogin> createState() => _TextInputLoginState();
}

class _TextInputLoginState extends State<TextInputLogin> {
  bool _showClearButton = false;
  bool _isFocused = false;
  bool isPasswordVisible = false; // Added property

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
          controller: widget.controller,
          autofocus: widget.autofocus,
          style: AppTextStyles.titleBold.copyWith(
            color: AppColors.blackLight,
            fontSize:
                checkIsPassword() ? AppSizes.font_14 * 0.9 : AppSizes.font_16,
          ),
          obscureText: checkIsPassword() ? !isPasswordVisible : false,
          obscuringCharacter: '⬤',
          //obscuringCharacter: '\u2022', // Customize the obscuring character
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              bottom: checkIsPassword()
                  ? AppSizes.mp_v_1 * 1.2
                  : AppSizes.mp_v_1 / 2,
              top: AppSizes.mp_v_1 / 2,
            ),
            labelText: _isFocused ? widget.hint : null,
            hintText: _isFocused ? null : widget.hint,
            hintStyle:
                AppTextStyles.titleBold.copyWith(color: AppColors.grayLighter),
            labelStyle:
                AppTextStyles.captionBold.copyWith(color: AppColors.grayLight),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            suffixIconConstraints: BoxConstraints(
              maxWidth: AppSizes.icon_size_10,
              maxHeight: AppSizes.icon_size_10,
            ),
            suffixIcon: widget.focusNode.hasFocus && _showClearButton
                ? Bounce(
                    onPressed: () {
                      widget.controller.clear();
                      setState(() {
                        _showClearButton = false;
                        _isFocused = false;
                      });
                    },
                    duration: const Duration(milliseconds: 120),
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
              widget.onChanged!(value); // Call the onChanged callback
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
            // Request focus for the password field when tapping
          },
          focusNode: widget.focusNode,
        ),
        checkIsPassword()
            ? Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: AppSizes.mp_v_1,
                  ),
                  child: buildHideUnhideButton(),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  bool checkIsPassword() {
    if (widget.isPassword) {
      return true;
    }
    return false;
  }

  buildHideUnhideButton() {
    return MaterialButton(
      padding: EdgeInsets.only(
        left: AppSizes.mp_w_2,
        right: AppSizes.mp_w_1 / 2,
      ),
      onPressed: () {
        setState(() {
          isPasswordVisible =
              !isPasswordVisible; // Toggle the visibility of the password
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SvgPicture.asset(
              isPasswordVisible
                  ? Assets.icons.eye
                  : Assets.icons
                      .eyeSlash, // Use different icons based on the password visibility
              color:
                  isPasswordVisible ? AppColors.primary : AppColors.grayLight,
              width: AppSizes.icon_size_6,
            ),
          ),
          SizedBox(
            width: AppSizes.mp_w_1,
          ),
          Flexible(
            child: Text(
              isPasswordVisible
                  ? "Show"
                  : "Hidden", // Change the text based on the password visibility
              style: AppTextStyles.captionBold.copyWith(
                color:
                    isPasswordVisible ? AppColors.primary : AppColors.grayLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
