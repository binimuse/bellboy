import 'package:bellboy/app/config/theme/app_colors.dart';
import 'package:bellboy/app/config/theme/app_sizes.dart';
import 'package:bellboy/app/config/theme/app_text_styles.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextInputLogin extends StatefulWidget {
  const TextInputLogin({Key? key, required this.hint, this.isPassword})
      : super(key: key);

  final String hint;
  final bool? isPassword;

  @override
  State<TextInputLogin> createState() => _TextInputLoginState();
}

class _TextInputLoginState extends State<TextInputLogin> {
  TextEditingController _textEditingController = TextEditingController();
  bool _showClearButton = false;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        _showClearButton = _textEditingController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _textEditingController,
          style: AppTextStyles.titleBold.copyWith(color: AppColors.blackLight),
          obscureText: checkIsPassword(),
          obscuringCharacter: '●',
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
                        _textEditingController.clear();
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
          },
          onTap: () {
            setState(() {
              _isFocused = true;
            });
          },
          onSubmitted: (value) {
            setState(() {
              _isFocused = false;
            });
          },
          //focusNode: FocusNode(),
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
      if (widget.isPassword!) {
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
