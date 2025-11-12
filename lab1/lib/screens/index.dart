import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_lab/widgets/exam_grid.dart';

import '../models/model.dart';
import 'package:intl/intl.dart';

class MyIndexPage extends StatefulWidget{
  const MyIndexPage({super.key, required this.title});

  final String title;

  @override
  State<MyIndexPage> createState() => _MyIndexPageState();
}

class _MyIndexPageState extends State<MyIndexPage>{
  late List<Exam> _exam;
  bool _isLoading = true;

  @override
  void initState(){
    super.initState();
    _loadExamList();
  }

  @override
  Widget build(BuildContext context){
    final total = _isLoading ? 0 : _exam.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _isLoading
        ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: EdgeInsets.all(12),
        child: ExamGrid(exam: _exam),
      ),
      bottomNavigationBar: Container(
        color: Colors.lightGreen,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Number of exams ', style: TextStyle(fontSize: 18)),
            const SizedBox(width: 8),
            Chip(
              label: Text('$total', style: const TextStyle(color: Colors.black, fontSize: 18)),
              backgroundColor: Colors.lightGreen,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            )
          ],
        ),
      ),
    );
  }

  void _loadExamList() async{
    List<Exam> examList = [];
    examList.add(Exam(id:1, name: 'Mathematics 1', dateTime: DateTime.parse('2025-09-20T09:00:00'), rooms: ['Classroom 1', 'Classroom 2']));
    examList.add(Exam(id:2, name: 'Mathematics 2', dateTime: DateTime.parse('2025-10-05T14:00:00'), rooms: ['Classroom 1']));
    examList.add(Exam(id:3, name: 'Advanced Programming', dateTime: DateTime.parse('2025-10-15T10:00:00'), rooms: ['Classroom 5', 'Classroom 6']));
    examList.add(Exam(id:4, name: 'Structural Programming', dateTime: DateTime.parse('2025-11-05T12:00:00'), rooms: ['Classroom 6']));
    examList.add(Exam(id:5, name: 'Object oriented Programming', dateTime: DateTime.parse('2025-11-01T08:30:00'), rooms: ['Classroom 4']));
    examList.add(Exam(id:6, name: 'Machine Learning', dateTime: DateTime.parse('2025-11-12T09:00:00'), rooms: ['Classroom 3']));
    examList.add(Exam(id:7, name: 'Web programming', dateTime: DateTime.parse('2025-11-20T15:00:00'), rooms: ['Classroom 3']));
    examList.add(Exam(id:8, name: 'Nature Language Processing', dateTime: DateTime.parse('2025-12-01T11:00:00'), rooms: ['Classroom 4']));
    examList.add(Exam(id:9, name: 'Software Engineering', dateTime: DateTime.parse('2025-12-10T13:00:00'), rooms: ['Classroom 4']));
    examList.add(Exam(id:10, name: 'Web design', dateTime: DateTime.parse('2026-01-08T10:00:00'), rooms: ['Classroom 2']));

    examList.sort((a,b)=>a.dateTime.compareTo(b.dateTime));
    setState(() {
      _exam=examList;
      _isLoading=false;
    });
  }
}