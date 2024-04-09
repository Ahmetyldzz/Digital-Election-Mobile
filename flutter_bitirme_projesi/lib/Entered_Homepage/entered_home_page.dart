import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Not_Entered_Homepage/home_page.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/custom_func.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/general_frame.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/project_colors.dart';
import 'package:flutter_bitirme_projesi/Entered_Homepage/election_enter_type_interface.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/salomon_navbar.dart';

class EnteredHomePage extends StatefulWidget {
  const EnteredHomePage({super.key});

  @override
  State<EnteredHomePage> createState() => _EnteredHomePageState();
}

class _EnteredHomePageState extends State<EnteredHomePage> {
  bool tesr1 = false;
  void test() {
    setState(() {
      tesr1 = !tesr1;
    });
  }
   final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;
  final List<Widget> pages = [
    UstKisim(text: "text"),
    UstKisim(text: "selam"),
    UstKisim(text: "merhaba"),
    UstKisim(text: "halo"),
    UstKisim(text: "halasdasdo"),
    UstKisim(text: "asdasdasdasdasdasda"),
  ];

 bool _ActiveButton = false;
  void buttonChanged() {
    setState(() {
      _ActiveButton = !_ActiveButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          bottomNavigationBar: SalomonBar(),
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: ProjectColors().darkTheme),
                    onPressed: () {
                      test();
                    },
                    child: Text(
                      "Oy Kullan",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: ProjectColors().background),
                    )),
              )
            ],
            title: Text("Anasayfa"),
          ),
          body: GeneralFrame(
              child:Column(
        children: [
          Expanded(
            flex: 9,
            child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _activePage = page;
                    });
                  },
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    return pages[index % pages.length];
                  },
                )),
          ),
          Expanded(
              flex: 1,
              child: AltKisim(
                  pages: pages,
                  pageController: _pageController,
                  activePage: _activePage)),
        ],
      ),
                  /* Visibility(visible: tesr1, child: ElectionEnterTypeMenu()) */),
        ),
        /* Container(
          color: Colors.amber,
          child: Center(child: ElectionEnterTypeMenu()),
        ), */
      ],
    );
  }
}
