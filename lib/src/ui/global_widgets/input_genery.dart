import 'package:flutter/material.dart';

class InputGenery extends StatelessWidget {
  const InputGenery(
      {super.key,
      this.obscureText,
      this.textInputType,
      this.prefixIcon,
      this.onChanged,
      this.hintText,
      this.isPrefixIcon = true,
      this.suixIcon,
      this.isSufixIcon = false,
      this.controller,
      this.onTap,
      this.colorPrefixIcon,
      this.sizePrefixIcon});

  final bool? obscureText;
  final TextInputType? textInputType;
  final IconData? prefixIcon;
  final Function(String)? onChanged;
  final bool isPrefixIcon;
  final Widget? suixIcon;
  final bool isSufixIcon;
  final Color? colorPrefixIcon;
  final double? sizePrefixIcon;

  final TextEditingController? controller;
  final String? hintText;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 50, minHeight: 40, maxWidth: 320, minWidth: 314),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType ?? TextInputType.emailAddress,
        obscureText: obscureText ?? false,
        onTap: onTap,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText ?? 'Correo',
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          prefixIcon: !isPrefixIcon ? null : Icon(prefixIcon ?? Icons.email_outlined, size: sizePrefixIcon ?? 15),
          suffixIcon: suixIcon,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class LabelAndInput extends StatelessWidget {
  const LabelAndInput({super.key, this.label, this.controller, this.hintText = "", this.onTap});
  final String? label;
  final TextEditingController? controller;
  final String? hintText;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label ?? "Ingresa tu nombre*"),
        const SizedBox(height: 10),
        InputGenery(
          controller: controller,
          onTap: onTap,
          hintText: hintText,
          isPrefixIcon: false,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
