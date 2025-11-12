import 'package:mis_lab/models/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailData extends StatelessWidget{
  final Exam exam;
  const DetailData({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Details',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 18),
          _infoRow('Subject', exam.name),
          _infoRow('Date', DateFormat('dd.MM.yyyy').format(exam.dateTime)),
          _infoRow('Time', DateFormat('HH:mm').format(exam.dateTime)),
          _infoRow('Clasrooms', exam.rooms.join(', ')),
          _infoRow('Time remaining', _formatRemaining(exam.dateTime)),
        ],
      )
    );
  }

  Widget _infoRow(String label, String value){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
            label,
            style: const TextStyle(color: Colors.lightGreen, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              textAlign: TextAlign.right,
              softWrap: true,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  String _formatRemaining(DateTime examDateTime){
    final now = DateTime.now();
    Duration diff = examDateTime.difference(now);

    final bool isPast = diff.isNegative;
    diff = diff.abs();

    final int days = diff.inDays;
    final int hours = diff.inHours - days *24;

    final String formatted = "$days days, $hours hours";
    return isPast? "Past: $formatted" : formatted;
  }
}