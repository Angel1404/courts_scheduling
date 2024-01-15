import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppPickers {
  static Future<DateTime?> suggestedDateAndTime(BuildContext context, {CupertinoDatePickerMode? mode, String? title}) async {
    DateTime? time;
    return await showCupertinoModalPopup<DateTime?>(
      context: context,
      builder: (_) => Container(
        width: double.infinity,
        height: 300,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 65,
              decoration: const BoxDecoration(
                color: Color(0xffF6F6F6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 8.0,
                    width: 110.0,
                    margin: const EdgeInsets.only(top: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(minimumSize: const Size(double.infinity, 20)),
                    onPressed: null,
                    child: Text(
                      title ?? "Fecha no seleccionada",
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CupertinoDatePicker(
                mode: mode ?? CupertinoDatePickerMode.time,
                minimumDate: mode != null ? DateTime.now() : null,
                maximumDate: mode != null ? DateTime(2040) : null,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (value) {
                  time = value;
                },
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              height: 50,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context, time);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                ),
                child: const Text(
                  "Seleccionar",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
