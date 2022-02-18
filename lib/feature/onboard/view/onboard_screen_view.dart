import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kartal/kartal.dart';
import 'package:covid_app/feature/login/view/login_view.dart';
import 'package:covid_app/feature/onboard/model/onboard_model.dart';
import 'package:covid_app/product/companents/text/app_text_strings.dart';

class OnBoardScreen extends StatefulWidget {
  OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Expanded(
            child: _buildPageViewController(context),
          ),
        ],
      ),
    );
  }

  PageView _buildPageViewController(BuildContext context) {
    return PageView.builder(
        controller: _controller,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemCount: models.length,
        itemBuilder: (_, i) {
          return _buildMainContainer(i, context);
        });
  }

  Column _buildMainContainer(int i, BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 1, child: SvgPicture.asset(models[i].image)),
        Expanded(
          flex: 1,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _navigationItemsRow(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  Text(
                    models[i].title,
                    textAlign: TextAlign.center,
                    style: context.textTheme.headline5?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(models[i].description,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyText1?.copyWith(
                          color: Colors.grey.shade500,
                        )),
                  ),
                  _buttonPageNavigiton(context)
                ]),
          ),
        )
      ],
    );
  }

  Container _navigationItemsRow() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            List.generate(models.length, (index) => _buildItemsPage(index)),
      ),
    );
  }

  Container _buttonPageNavigiton(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.06),
      margin: const EdgeInsets.all(40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.grey.shade400, minimumSize: const Size(100, 100)),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LoginView()));
            },
            child: Text(AppString().buttonSkip.toString()),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: context.appTheme.primaryColor,
                minimumSize: const Size(100, 100)),
            onPressed: () {
              if (currentIndex == models.length - 1) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginView()));
              }
              _controller?.nextPage(
                  duration: context.durationNormal, curve: Curves.easeIn);
            },
            child: Text(AppString().buttonText.toString()),
          ),
        ],
      ),
    );
  }

  Container _buildItemsPage(int index) {
    return Container(
      height: context.dynamicHeight(0.015),
      width: currentIndex == index ? 15 : 10,
      margin: const EdgeInsets.only(right: 3),
      decoration: BoxDecoration(
          color: currentIndex == index
              ? Theme.of(context).primaryColor
              : Colors.grey.shade400,
          border: Border.all(color: context.appTheme.primaryColor),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
    );
  }
}
