import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

import '../datetime/date_time.dart';

class MonthlySummary extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;

  const MonthlySummary({
    super.key,
    required this.datasets,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: HeatMap(
        startDate: createDateTimeObject(startDate),
        endDate: DateTime.now().add(Duration(days: 0)),
        datasets: datasets,
        colorMode: ColorMode.color,
        defaultColor: Colors.grey[200],
        textColor: Colors.black,
        showColorTip: false,
        showText: true,
        scrollable: true,
        size: 30,
        colorsets: const {
          1: Color.fromARGB(20, 57, 207, 243),
          2: Color.fromARGB(40, 57, 207, 243),
          3: Color.fromARGB(60, 57, 207, 243),
          4: Color.fromARGB(80, 57, 207, 243),
          5: Color.fromARGB(190, 57, 207, 243),
          6: Color.fromARGB(110, 57, 207, 243),
          7: Color.fromARGB(140, 57, 207, 243),
          8: Color.fromARGB(170, 57, 207, 243),
          9: Color.fromARGB(210, 57, 207, 243),
          10: Color.fromARGB(255, 57, 207, 243),
        },
        onClick: (value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.toString())));
        },
      ),
    );
  }
}
