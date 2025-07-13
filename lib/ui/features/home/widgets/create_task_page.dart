import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  bool isRepeat = false;
  List<DateTime> specificDates = [];
  TimeOfDay? repeatTime;
  List<String> repeatDays = [];

  final List<String> weekDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      context.pop({
        "name": _nameController.text.trim(),
        "description": _descriptionController.text.trim(),
        "repeat": isRepeat,
        "repeatDays": repeatDays,
        "repeatTime": repeatTime?.format(context),
        "specificDates": specificDates.map((d) => d.toIso8601String()).toList(),
      });
    }
  }

  Future<void> _selectDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (time != null) {
        setState(() {
          specificDates.add(DateTime(date.year, date.month, date.day, time.hour, time.minute));
        });
      }
    }
  }

  Future<void> _selectRepeatTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        repeatTime = time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primaryContainer,
      appBar: AppBar(
        title: const Text('Create Task'),
        elevation: 0,
        backgroundColor: theme.colorScheme.primaryContainer,
        foregroundColor: theme.colorScheme.onPrimaryContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Task Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(
                      Icons.task_alt,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a task name';
                    }
                    if (value.trim().length < 3) {
                      return 'Task name must be at least 3 characters';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(
                      Icons.description,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a description';
                    }
                    if (value.trim().length < 10) {
                      return 'Description must be at least 10 characters';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('Repeat Task:'),
                    Switch(
                      value: isRepeat,
                      onChanged: (value) {
                        setState(() {
                          isRepeat = value;
                        });
                      },
                    ),
                  ],
                ),
                if (isRepeat) ...[
                  ElevatedButton(
                    onPressed: _selectRepeatTime,
                    child: Text(repeatTime != null
                        ? 'Repeat Time: ${repeatTime!.format(context)}'
                        : 'Select Repeat Time'),
                  ),
                  Wrap(
                    children: weekDays.map((day) {
                      final isSelected = repeatDays.contains(day);
                      return ChoiceChip(
                        label: Text(day),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              repeatDays.add(day);
                            } else {
                              repeatDays.remove(day);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ] else ...[
                  ElevatedButton(
                    onPressed: _selectDateTime,
                    child: const Text('Add Specific Date & Time'),
                  ),
                  Column(
                    children: specificDates.map((d) {
                      return ListTile(
                        title: Text(DateFormat('yyyy-MM-dd – kk:mm').format(d)),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              specificDates.remove(d);
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ],
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: const Text('Create Task'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
