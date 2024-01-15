import 'package:court_scheduling/providers/providers.dart';
import 'package:court_scheduling/src/ui/utils/formats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'global_widgets.dart';

dialoginfo(BuildContext context, {String title = ""}) async {
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BtnApp(
              titleBtn: "OK",
              width: 200,
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      );
    },
  );
}

getInfoBtnSheetRains(BuildContext context, List<String> times, List<int> rains, WidgetRef ref) async {
  showBottomSheet(
      enableDrag: true,
      elevation: 8,
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .6),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      context: context,
      builder: (context) {
        final totalChanceRain = ref.read(addCourtCProvider).chanceOfRain;
        return DetailDataRain(totalChanceRain: totalChanceRain, rains: rains, times: times);
      });
}

class DetailDataRain extends StatelessWidget {
  const DetailDataRain({
    super.key,
    required this.totalChanceRain,
    required this.times,
    required this.rains,
  });

  final String totalChanceRain;
  final List<String> times;
  final List<int> rains;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Text("Porcentaje humedad total del dia: ${double.parse(totalChanceRain).round()}%"),
          const SizedBox(height: 20),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(times.length > 24 ? 24 : times.length, (index) {
                final date = DateTime.parse(times[index]).toLocal();
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(formatDate(date, format: "yMMMMEEEEd") + formatDate(date, format: " - HH:mm a")),
                        Text("${rains[index]}%"),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 25),
          BtnApp(titleBtn: "Entendido", onPressed: () => Navigator.pop(context)),
        ],
      ),
    );
  }
}
