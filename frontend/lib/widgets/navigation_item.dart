import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

class NavigationItem extends StatefulWidget {
  const NavigationItem({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    this.flip = false,
  });

  final String title;
  final IconData icon;
  final Color color;
  final bool flip;

  @override
  State<NavigationItem> createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovering = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: JustTheTooltip(
        tailLength: 10,
        preferredDirection: AxisDirection.right,
        backgroundColor: primaryColor,
        offset: 15,
        content: Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            widget.title,
            style: const TextStyle(color: primaryFontColor),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: isHovering ? Colors.white10 : null,
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Transform.flip(
            flipX: widget.flip,
            child: Icon(
              widget.icon,
              color: widget.color,
            ),
          ),
        ),
      ),
    );
  }
}
