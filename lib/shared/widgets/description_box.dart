import 'package:flutter/material.dart';

import '../styles/styles.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsetsDirectional.all(10.0),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        color: const Color(0XFF80542F).withOpacity(.2),
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //description title
          Text("Description",style: AppStyles.mBold16(context),),

          //space
          const SizedBox(height: 20,),


          //description text
          const FittedBox(child: Text("20-30  Lorem ipsum dolor sit amet consectetur. ")),

          //space
          const SizedBox(height: 20,),

          const FittedBox(child: Text("20-30  Lorem ipsum dolor sit amet consectetur. ")),

          //space
          const SizedBox(height: 20,),

          const FittedBox(child: Text("20-30  Lorem ipsum dolor sit amet consectetur. ")),

          //space
          const SizedBox(height: 20,),

          const FittedBox(child: Text("20-30  Lorem ipsum dolor sit amet consectetur. ")),

          //space
          const SizedBox(height: 20,),

        ],
      ),
    );
  }
}