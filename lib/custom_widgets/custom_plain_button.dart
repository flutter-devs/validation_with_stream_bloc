import 'package:flutter/material.dart';


class CustomPlainButton extends StatelessWidget {
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  final Color btnColor;
  final bool isEnabled;
  final bool isExpanded;
  final Color lblColor;
  final VoidCallback? onTap;
  final String label;
  final TextStyle? style;
  final double? height;
  final double paddingHorizontal;
  final double paddingVertical;
  final IconData? icon;

  const CustomPlainButton({
    this.borderColor = Colors.red,
    this.borderRadius = 35,
    this.borderWidth = 2,
    this.btnColor = Colors.red,
    this.height,
    this.icon,
    this.isEnabled = true,
    this.isExpanded = false,
    this.lblColor = Colors.white,
    this.label = '',
    this.onTap,
    this.style,
    this.paddingHorizontal = 20,
    this.paddingVertical = 20,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        height: height,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal,
          vertical: paddingVertical,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: isEnabled ? borderColor : Colors.grey,
            width: borderWidth,
          ),
          color: isEnabled ? btnColor : Colors.grey,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: (icon != null)
            ? Row(
                children: [
                  isExpanded
                      ? Expanded(child: _buildTextPart())
                      : _buildTextPart(),
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 25,
                  ),
                ],
              )
            : isExpanded
                ? Expanded(child: _buildTextPart())
                : _buildTextPart(),
      ),
    );
  }

  _buildTextPart() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: style ?? const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
