import 'package:flutter/material.dart';
import 'package:sawa/screens/home/home_controls/location_search.dart';


class LocationSearch extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSearchPressed;
  final String? initialValue;

  const LocationSearch({
    Key? key,
    this.onChanged,
    this.onSearchPressed,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: initialValue != null
                  ? TextEditingController(text: initialValue)
                  : null,
              decoration: InputDecoration(
                hintText: 'Search for a location...',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.blue.shade600,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
              ),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
              onChanged: onChanged,
            ),
          ),
          LocationSearchButton(
            onPressed: onSearchPressed,
          ),
        ],
      ),
    );
  }
}