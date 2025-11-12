import 'package:flutter/material.dart';
import '../models/model.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget{
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final bool isPast = exam.dateTime.isBefore(now);
    final Color borderColor = isPast ? Colors.red.shade200 : Colors.green.shade700;
    final Color backgroundColor = isPast ? Colors.red.shade100 : Colors.green.shade100;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/details", arguments: exam);
      },
      child: Card(
        color: backgroundColor,
        shape: BeveledRectangleBorder(
          side: BorderSide(color: borderColor, width: 3),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Text(exam.name, style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
              // Divider(color: borderColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Tooltip(message: 'Date', child: Icon(Icons.calendar_today, size: 20, color: borderColor)),
                      const SizedBox(width: 6),
                      Text(DateFormat('dd.MM.yyyy').format(exam.dateTime), style: const TextStyle(fontSize: 20)),
                    ],
                  ),
                  Row(
                    children: [
                      Tooltip(message: 'Time', child: Icon(Icons.access_time, size: 20, color: borderColor)),
                      const SizedBox(width: 6),
                      Text(DateFormat('HH:mm').format(exam.dateTime), style: const TextStyle(fontSize: 20)),
                    ],
                  ),
                ],
              ),
              // Divider(color: borderColor),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tooltip(message: 'Classrooms', child: Icon(Icons.meeting_room, size: 16, color: borderColor)),
                  Flexible(
                    child: Text(
                      exam.rooms.join(', '),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black,fontSize: 18),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
}
}