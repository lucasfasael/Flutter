import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/helpers/weekday.dart';

import '../../models/journal.dart';

class AddJournalScreen extends StatelessWidget {
  final Journal journal;
  const AddJournalScreen({required this.journal, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${WeekDay(journal.createdAt.weekday).long.toLowerCase()}, ${journal.createdAt.day} | ${journal.createdAt.month} |  ${journal.createdAt.year}"
        ),
        actions: [Icon(Icons.check)],
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          expands: true,
          maxLines: null,
          minLines: null,
        ),
      ),
    );
  }
}