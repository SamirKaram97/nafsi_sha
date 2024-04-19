import 'package:flutter/material.dart';
import 'package:gp_nafsi/shared/utils/strings.dart';
import 'package:gp_nafsi/generated/l10n.dart';
import '../styles/styles.dart';

class DividerWithOrSection extends StatelessWidget {
  const DividerWithOrSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 64,
        ),
        const Expanded(
          child: Divider(
            height: 1,
            color: Color(0xFFD9D9D9),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            S.of(context).or,
            style: AppStyles.rLight16(context),
          ),
        ),
        const Expanded(
          child: Divider(
            height: 1,
            color: Color(0xFFD9D9D9),
          ),
        ),
        const SizedBox(
          width: 64,
        ),
      ],
    );
  }
}
