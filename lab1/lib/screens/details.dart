


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mis_lab/widgets/detail_data.dart';

import '../models/model.dart';

class DetailsPage extends StatelessWidget{
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context){
    final exam = ModalRoute.of(context)!.settings.arguments as Exam;

    return Scaffold(
      backgroundColor: Colors.lightGreen.shade50,
      appBar: AppBar(
        title: Text(exam.name.toUpperCase()),
        centerTitle: true,
        backgroundColor: Colors.lightGreen.shade400,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const SizedBox(height: 30),
            DetailData(exam:exam),
          ],
        ),
      ),
    );
  }
}