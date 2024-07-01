import 'package:flutter/material.dart';
import 'package:gp_nafsi/layout/cubit/layout_cubit.dart';

class AvatarImage extends StatelessWidget {
   AvatarImage({
    super.key,
    this.h,
    this.w,
  });
  double? h;
  double? w;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w??69,
      height: h??69,
      decoration:  ShapeDecoration(
        image: DecorationImage(
          image: NetworkImage(
              LayoutCubit.get(context).userModel?.profileImage?? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
          fit: BoxFit.fill,
        ),
        shape: const OvalBorder(
          side: BorderSide(
            width: 3,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFFAEAEAE),
          ),

        ),
      ),
    );
  }
}