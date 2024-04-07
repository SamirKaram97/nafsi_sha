import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../models/message_model.dart';
import '../styles/colors.dart';
import '../styles/images.dart';
import '../styles/styles.dart';

class BotMessageWidget extends StatelessWidget {
  const BotMessageWidget({super.key, required this.messageModel});
  final MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(Assets.imagesBotIcon),
          ),
        ),
        const SizedBox(width: 8,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Container(
              padding: const EdgeInsetsDirectional.all(16),
              decoration: const ShapeDecoration(
                color: Color(0xFFE8EAEC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
              ),
              child: Text(
                messageModel.content,
                style: AppStyles.aLight16(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}