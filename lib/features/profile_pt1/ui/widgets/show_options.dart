import 'package:flutter/material.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';

class ShowDropDownOptions extends StatefulWidget {
  final int initialEntries;
  final ValueChanged<int> onEntriesChanged;

  const ShowDropDownOptions({
    super.key,
    this.initialEntries = 10,
    required this.onEntriesChanged,
  });

  @override
  State<ShowDropDownOptions> createState() => _ShowDropDownOptionsState();
}

class _ShowDropDownOptionsState extends State<ShowDropDownOptions> {
  late int _selectedEntries;

  @override
  void initState() {
    super.initState();
    _selectedEntries = widget.initialEntries;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Show', style: TextStyle(color: Colors.grey[600], fontSize: 14)),
        const SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: _selectedEntries,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.blueGrey[700],
              ),
              elevation: 2,
              style: TextStyle(
                color: Colors.blueGrey[900],
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              onChanged: (int? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedEntries = newValue;
                  });
                  widget.onEntriesChanged(newValue);
                }
              },
              items:
                  const [5, 10, 20].map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text('$value'),
                    );
                  }).toList(),
            ),
          ),
        ),
        horizontalSpace(4),
        Text(
          'entries',
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
      ],
    );
  }
}
