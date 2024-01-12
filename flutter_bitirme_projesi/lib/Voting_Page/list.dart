import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/Voting_Page/custom_card_model.dart';

class ListViewDeneme extends StatefulWidget {
  const ListViewDeneme({super.key});

  @override
  State<ListViewDeneme> createState() => _ListViewDenemeState();
}

class _ListViewDenemeState extends State<ListViewDeneme> {
  List<CustomCardModel>? model1;
  int _activeindex = 0;
  onIndexChanged(int index) {
    setState(() {
      _activeindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          // onIndexChanged(index);
          return InkWell(
            onTap: () {
              onIndexChanged(index);
            },
            child: Container(
              width: 200,
              height: 200,
              color: (_activeindex == index
                  ? ProjectColors().darkTheme
                  : ProjectColors().likePink),
            ),
          );
        },
      ),
    );
  }
}
