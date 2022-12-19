import 'package:flutter/material.dart';
import 'package:habittracker/components/month_summary.dart';
import 'package:habittracker/components/my_fab.dart';
import 'package:habittracker/components/my_alert_box.dart';
import 'package:habittracker/data/habit_database.dart';
import 'package:hive/hive.dart';
import '../components/habit_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box('Habit_Database');

  @override
  void initState() {
    if (_myBox.get('CURRENT_HABIT_LIST') == null) {
      db.createDefaultData();
    } else {
      db.loadData();
    }

    db.updateDatabase();
    super.initState();
  }

  void checkBoxTrapped(bool? value, int index) {
    setState(() {
      db.todaysHabitList[index][1] = value;
    });
    db.updateDatabase();
  }

  final _newHabitNameController = TextEditingController();

  void createNewHabit() {
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertBox(
            controller: _newHabitNameController,
            onSave: saveNewHabit,
            onCancel: cancelDialogBox,
            hintText: 'Enter Habit Name',
          );
        });
  }

  void saveNewHabit() {
    setState(() {
      db.todaysHabitList.add([_newHabitNameController.text, false]);
    });
    _newHabitNameController.clear();
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void cancelDialogBox() {
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  void openHabitSettings(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertBox(
            controller: _newHabitNameController,
            onSave: () => saveExistingHabit(index),
            onCancel: cancelDialogBox,
            hintText: db.todaysHabitList[index][0],
          );
        });
  }

  void saveExistingHabit(int index) {
    setState(() {
      db.todaysHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void deleteHabit(int index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: MyFloatingActionButton(
        onPressed: createNewHabit,
      ),
      body: ListView(
        children: [
          // MONTHLY SUMMARY HEAT MAP
          MonthlySummary(
            datasets: db.heatMapDataSet,
            startDate: _myBox.get("START_DATE"),
          ),

          // LIST OF HABITS
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: db.todaysHabitList.length,
              itemBuilder: (context, index) {
                return HabitTile(
                  habitCompleted: db.todaysHabitList[index][1],
                  habitName: db.todaysHabitList[index][0],
                  onChanged: (value) => checkBoxTrapped(value, index),
                  settingsTapped: (context) => openHabitSettings(index),
                  deleteTapped: (context) => deleteHabit(index),
                );
              }),
        ],
      ),
    );
  }
}
