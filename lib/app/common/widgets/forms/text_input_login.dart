import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/app/modules/login/controllers/login_controller.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextInputLogin extends StatefulWidget {
  const TextInputLogin({
    Key? key,
    required this.hint,
    this.isPassword = false,
    required this.controller,
    this.logincontroller,
    this.validator,
    this.focusNode,
    this.onChanged, // Added onChanged callback
  }) : super(key: key);

  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final LoginController? logincontroller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final void Function(String)? onChanged; // Callback when the text changes

  @override
  State<TextInputLogin> createState() => _TextInputLoginState();
}

class _TextInputLoginState extends State<TextInputLogin> {
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
          controller: widget.controller,
          textInputAction:
              widget.isPassword ? TextInputAction.done : TextInputAction.next,
          style: AppTextStyles.titleBold.copyWith(color: AppColors.blackLight),
          obscureText: checkIsPassword(),
          obscuringCharacter: '●',
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
                    icon: SvgPicture.asset(
                      Assets.icons.cancel,
                      color: AppColors.grayLight,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.controller.clear();
                        _showClearButton = false;
                        widget.logincontroller!.isEmailValidated.value = false;
                        widget.logincontroller!.isNextPressed.value = false;
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
              widget.onChanged!(value); // Call the onChanged callback
            }
          },
          onTap: () {
            setState(() {
              _isFocused = true;
            });
          },
          focusNode: widget.focusNode,
        ),

        ///
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
            : SizedBox(),
      ],
    );
  }

  bool checkIsPassword() {
    if (widget.isPassword != null) {
      if (widget.isPassword) {
        return true;
      }
    }
    return false;
  }

  buildHideUnhideButton() {
    return MaterialButton(
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            Assets.icons.eyeSlash,
            color: AppColors.grayLighter,
            width: AppSizes.icon_size_6,
          ),
          SizedBox(
            width: AppSizes.mp_w_2,
          ),
          Text(
            "Hidden",
            style: AppTextStyles.captionBold.copyWith(
              color: AppColors.grayLight,
            ),
          ),
        ],
      ),
    );
  }
}
