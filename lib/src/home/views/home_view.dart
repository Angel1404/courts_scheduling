import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:court_scheduling/providers/providers.dart';
import 'package:court_scheduling/src/ui/utils/utils.dart';
import 'package:court_scheduling/src/src.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agendamientos"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddCourtView(),
          ),
        ).then((value) => ref.read(homeProvider.notifier).getCourts()),
        child: const Icon(Icons.add),
      ),
      body: const BodyTemplate(
        child: Body(),
      ),
    );
  }
}

class Body extends ConsumerStatefulWidget {
  const Body({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BodyState();
}

class _BodyState extends ConsumerState<Body> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(homeProvider.notifier).getCourts();
    });
  }

  deleteCourt(int idCourt) async {
    await dialoginfo(context, title: "¿Seguro que quieres borrar este agendamiento?");
    ref.read(homeProvider.notifier).deleteCourt(idCourt);
  }

  @override
  Widget build(BuildContext context) {
    final controllerCourts = ref.watch(homeProvider);
    if (controllerCourts.isLoadingCourts) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    if (controllerCourts.courts.isEmpty) {
      return const Center(child: Text("No hay canchas agendadas de momento"));
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 20),
      itemBuilder: (context, index) {
        final court = controllerCourts.courts[index];
        return Card(
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formatDate(DateTime.parse(court.date), format: "yMMMMEEEEd"),
                  style: const TextStyle(fontSize: 12),
                ),
                Text(court.nameCourt),
              ],
            ),
            subtitle: Text(court.nameUser),
            leading: IconButton(onPressed: () => deleteCourt(court.id), icon: const Icon(Icons.delete_forever_rounded)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.bloodtype_rounded, color: Colors.blue),
                Text("${double.parse(court.changeOfRain).round()}%"),
              ],
            ),
          ),
        );
      },
      itemCount: controllerCourts.courts.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}
