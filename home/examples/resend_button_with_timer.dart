import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ResendButtonWithTimer extends StatefulWidget {
  const ResendButtonWithTimer({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  State<ResendButtonWithTimer> createState() => _ResendButtonWithTimerState();
}

class _ResendButtonWithTimerState extends State<ResendButtonWithTimer> {
  String currentSecond = '60';
  bool isCountDown = false;

  // init timer for resend code
  void initTimer() {
    setState(() {
      isCountDown = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        currentSecond = '${int.parse(currentSecond) - 1}';
      });
      if (int.parse(currentSecond) > 0) {
        initTimer();
      } else {
        setState(() {
          isCountDown = false;
          currentSecond = '60';
        });
      }
    });
  }

  @override
  void initState() {
    initTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RichTextButton(
      text1: 'Resend ',
      color1: isCountDown == false ? null : Colors.grey,
      text2: isCountDown == false ? '' : '${currentSecond}s',
      onPressed1: () {
        if (isCountDown == false) {
          // TODO: Remove comment to use resend code function
          // widget.onPressed!();
          initTimer();
        }
      },
    );
  }
}

class RichTextButton extends StatelessWidget {
  final String? text1;
  final Color? color1;
  final String? text2;
  final Color? color2;
  final VoidCallback? onPressed1;
  final VoidCallback? onPressed2;
  final bool isBorder;
  final AlignmentGeometry? alignment;

  const RichTextButton({
    Key? key,
    this.text1,
    this.color1,
    this.text2,
    this.color2,
    this.onPressed1,
    this.onPressed2,
    this.isBorder = false,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isBorder
          ? const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 12,
            )
          : null,
      width: double.infinity,
      alignment: alignment,
      decoration: isBorder
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.fromBorderSide(
                BorderSide(
                  color: Colors.grey.withOpacity(0.6),
                ),
              ),
            )
          : null,
      child: Text.rich(
        TextSpan(
          text: text1,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: color1,
          ),
          recognizer: TapGestureRecognizer()..onTap = onPressed1,
          children: [
            const TextSpan(
              text: '  ',
            ),
            TextSpan(
              text: text2,
              style: TextStyle(
                color: color2 ?? Colors.purple,
                fontWeight: FontWeight.w600,
              ),
              recognizer: TapGestureRecognizer()..onTap = onPressed2,
            ),
          ],
        ),
      ),
    );
  }
}
