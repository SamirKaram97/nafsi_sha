import 'package:flutter/material.dart';

import '../styles/styles.dart';

class TestAndExplainResult extends StatelessWidget {
  const TestAndExplainResult({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text("Lorem ipsum dolor sit amet ",style: AppStyles.mExtraBold35(context),),
        Text(longLorem,style: AppStyles.mMedium16(context),),
      ],
    );
  }
  final String longLorem="Lorem ipsum dolor sit amet consectetur. Libero vitae erat donec sed gravida ac facilisi. Euismod dui eget ut egestas. Sit nibh id aliquam suspendisse rhoncus auctor. Sed etiam platea faucibus id ac.Id risus vivamus facilisi pellentesque velit pulvinar suspendisse nunc. Massa viverra scelerisque ut enim mattis nec sed. Dis sapien non pellentesque nunc malesuada pharetra faucibus molestie. Pellentesque imperdiet risus nulla non elementum venenatis. Fringilla condimentum eu feugiat amet. Ultricies morbi convallis dolor sed risus dui. Ac euismod orci dolor tristique metus pretium. Mi fermentum morbi vel enim nunc sapien. Ut elementum nec at est convallis mi ac blandit. Aliquet non nam faucibus diam neque. Gravida cras amet maecenas accumsan non quis ipsum tempor. Tellus scelerisque quam morbi viverra donec laoreet amet tincidunt. Lacus in integer enim amet quis luctus. Pharetra nibh dui in purus eget donec viverra nulla vitae. Eu id viverra amet eu amet leo ";
}
