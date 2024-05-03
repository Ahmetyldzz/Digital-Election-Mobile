import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/model/postmodel.dart';

class VotingResults extends StatefulWidget {
  const VotingResults({super.key, required this.electionNewModel});
  final ElectionNewModel electionNewModel;

  @override
  State<VotingResults> createState() => _VotingResultsState();
}

class _VotingResultsState extends State<VotingResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors().background,
      appBar: AppBar(
        title: Text(
          "Result",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.black,
              ),
        ),
      ),
    );
  }
}
