import 'package:court_scheduling/providers/providers.dart';
import 'package:court_scheduling/src/ui/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../ui/ui.dart';
import '../add_court.dart';

class AddCourtView extends StatelessWidget {
  const AddCourtView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crear Agendamiento de cancha")),
      body: const BodyTemplate(
        isScroll: true,
        child: BodyAddCourt(),
      ),
    );
  }
}

class BodyAddCourt extends ConsumerStatefulWidget {
  const BodyAddCourt({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => BodyAddCourtState();
}

class BodyAddCourtState extends ConsumerState<BodyAddCourt> {
  late final TextEditingController _nameUserTxt;

  @override
  void initState() {
    super.initState();
    _nameUserTxt = TextEditingController();
  }

  @override
  void dispose() {
    _nameUserTxt.dispose();
    super.dispose();
  }

  onChange(String? value) {
    if (value == listCourts.first) {
      dialoginfo(context, title: "Cancha seleccionada no valida");
      return;
    }
    ref.read(addCourtCProvider.notifier).setCourt(value ?? "");
  }

  onSeletedDate() async {
    FocusScope.of(context).unfocus();

    final response = await onSelectDateTime(context);
    if (response != null) {
      final controller = ref.read(addCourtCProvider.notifier);
      controller.setDate(response.value1, response.value);
      final rains = await controller.getRain();
      if (rains != null && mounted) {
        await getInfoBtnSheetRains(context, rains.hourly.time, rains.hourly.relativeHumidity2M, ref);
      }
    }
  }

  createCourtScheduling() async {
    final response = await ref.read(addCourtCProvider.notifier).createCourtScheduling(_nameUserTxt.text);
    if (response.isError && mounted) {
      dialoginfo(context, title: response.errorText ?? "Info con admin");
      return;
    }

    if (mounted) {
      dialoginfo(context, title: "Agendacion creada");
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(addCourtCProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        children: [
          LabelAndDrop(valueSeleted: listCourts.first, items: listCourts, onChange: onChange),
          LabelAndInput(controller: _nameUserTxt),
          LabelAndInput(
            onTap: onSeletedDate,
            hintText: controller.dateComplete,
            label: "Fecha de agendamiento*",
          ),
          const SizedBox(height: 40),
          BtnApp(onPressed: createCourtScheduling, titleBtn: "Agendar cancha"),
        ],
      ),
    );
  }
}
