import 'package:flutter/material.dart';

class LocationSearchButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double size;
  final Color color;

  const LocationSearchButton({
    Key? key,
    this.onPressed,
    this.size = 48,
    this.color = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: color.withOpacity(0.1),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onPressed,
        child: Container(
          width: size,
          height: size,
          padding: const EdgeInsets.all(8),
          child: Icon(
            Icons.location_on,
            color: color,
            size: size * 0.5,
          ),
        ),
      ),
    );
  }
}