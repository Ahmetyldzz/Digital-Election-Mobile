import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({super.key});

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors().background,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: ""),
        ],
      ),
      appBar: AppBar(
        backgroundColor: ProjectColors().commonTheme,
        title: Text(
          "Login Page",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: ProjectColors().background),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 35),
        child: Container(
          width: 400,
          height: 700,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ProjectColors().commonTheme,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(label: Text("Body")),
              ),
              TextField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(label: Text("Body")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
