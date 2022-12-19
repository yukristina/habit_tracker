import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatelessWidget {
  HabitTile(
      {Key? key,
      required this.habitName,
      required this.habitCompleted,
      this.onChanged,
      this.settingsTapped,
      this.deleteTapped})
      : super(key: key);

  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext?)? settingsTapped;
  final Function(BuildContext?)? deleteTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            //SETTINGS OPTION
            SlidableAction(
              onPressed: settingsTapped,
              backgroundColor: Colors.grey.shade800,
              icon: Icons.settings,
              borderRadius: BorderRadius.circular(12),
            ),

            // DELETE OPTIONS
            SlidableAction(
              onPressed: deleteTapped,
              backgroundColor: Colors.red.shade800,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              // CHECKBOX
              Checkbox(
                value: habitCompleted,
                onChanged: onChanged,
              ),

              // HABIT TIME
              Text(
                habitName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
