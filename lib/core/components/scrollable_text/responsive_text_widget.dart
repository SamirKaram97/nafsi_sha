import 'package:flutter/material.dart';
import 'package:gp_nafsi/core/components/scrollable_text/default_text_scroll.dart';

class ResponsiveText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? width;
  final double? height;
  final int? maxLines;
  final TextAlign? textAlign;

  const ResponsiveText(
    this.text, {
    super.key,
    this.style,
    this.width,
    this.height,
    this.maxLines,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    // Measure the text to see if it fits within the given width
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style ?? const TextStyle()),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    final bool shouldScroll = (width != null && textPainter.width > width!);

    return shouldScroll
        ? SizedBox(
            width: width,
            height: height,
            child: TextScroll(
              text,
              mode: TextScrollMode.endless,
              // You can change the scrolling mode if needed
              velocity: const Velocity(pixelsPerSecond: Offset(30, 0)),
              // Adjust the speed as needed
              style: style ?? const TextStyle(),
              delayBefore: const Duration(milliseconds: 500),
              pauseBetween: const Duration(milliseconds: 50),
              textAlign: textAlign ?? TextAlign.left,
              // Align the text as needed
              selectable: false,
            ),
          )
        : Text(
            text,
            style: style ?? const TextStyle(),
            overflow:
                TextOverflow.ellipsis, // Show ellipsis if the text doesn't fit
            maxLines: maxLines, textAlign: textAlign,
          );
  }
}
