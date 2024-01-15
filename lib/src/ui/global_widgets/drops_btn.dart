import 'package:flutter/material.dart';

class DropButtomApp extends StatefulWidget {
  const DropButtomApp({
    super.key,
    required this.valueSeleted,
    required this.items,
    required this.onChange,
    this.enabled = true,
  });

  final String valueSeleted;
  final List<String> items;
  final Function(String? value) onChange;
  final bool enabled;

  @override
  State<DropButtomApp> createState() => _DropButtomAppState();
}

class _DropButtomAppState extends State<DropButtomApp> {
  String valueSeleted = "";

  @override
  void initState() {
    super.initState();

    valueSeleted = widget.valueSeleted;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 50, minHeight: 40, maxWidth: 320, minWidth: 314),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      height: 50,
      width: double.maxFinite,
      child: DropdownButton<String>(
        menuMaxHeight: 300,
        isExpanded: true,
        underline: const SizedBox(),
        value: valueSeleted,
        items: List.generate(
          widget.items.length,
          (index) {
            final category = widget.items[index];
            return DropdownMenuItem(
              value: category,
              child: Text(category),
            );
          },
        ),
        onChanged: widget.enabled
            ? (value) {
                if (value != null) {
                  setState(() {
                    valueSeleted = value;
                  });
                  widget.onChange(value);
                }
              }
            : null,
      ),
    );
  }
}

class LabelAndDrop extends StatelessWidget {
  const LabelAndDrop({super.key, required this.valueSeleted, required this.items, required this.onChange, this.enabled = true, this.label});
  final String valueSeleted;
  final List<String> items;
  final Function(String? value) onChange;
  final bool enabled;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label ?? "Seleccione una cancha*"),
        const SizedBox(height: 10),
        DropButtomApp(valueSeleted: valueSeleted, items: items, onChange: onChange),
        const SizedBox(height: 10),
      ],
    );
  }
}
