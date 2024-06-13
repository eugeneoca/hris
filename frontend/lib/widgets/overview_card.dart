import 'package:flutter/material.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black45, width: 0.5),
      ),
      //color: Colors.amber,
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            size: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
