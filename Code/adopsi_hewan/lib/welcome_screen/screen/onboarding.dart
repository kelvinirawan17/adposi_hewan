import 'dart:io';
import './login.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final int _totalPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  int submit = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                _currentPage = page;
                setState(() {});
              },
              children: <Widget>[
                _buildPageContent(
                  isShowImageOnTop: false,
                  image: 'assets/images/search.png',
                  body: 'Mudah Dicari',
                  desc:
                      'Dapat mudah mencari hewan peliharaan sesuai dengan keinginan',
                  color: Color.fromRGBO(131, 128, 255, 1),
                ),
                _buildPageContent(
                  isShowImageOnTop: false,
                  image: 'assets/images/deal.png',
                  body: 'Gampang Deal',
                  desc:
                      'Dengan mudah menghubungi pemilik hewan yang ingin diadopsi',
                  color: Color.fromRGBO(239, 115, 130, 1),
                ),
                _buildPageContent(
                  isShowImageOnTop: false,
                  image: 'assets/images/adopt.png',
                  body: 'Langsung Dimiliki',
                  desc:
                      'Dapat langsung dimiliki setelah bernegosiasi dengan pemilik hewan',
                  color: Color.fromRGBO(160, 93, 93, 1),
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              left: MediaQuery.of(context).size.width * .05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .9,
                    child: Row(
                      children: [
                        Container(
                          child: Row(children: [
                            for (int i = 0; i < _totalPages; i++)
                              i == _currentPage
                                  ? _buildPageIndicator(true)
                                  : _buildPageIndicator(false)
                          ]),
                        ),
                        Spacer(),
                        if (_currentPage != 2)
                          InkWell(
                            onTap: () {
                              _pageController.animateToPage(2,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.linear);
                              setState(() {});
                            },
                            child: Container(
                              height: Platform.isIOS ? 70 : 60,
                              alignment: Alignment.center,
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        if (_currentPage == 2)
                          ButtonTheme(
                            minWidth: 120.0,
                            height: 40.0,
                            buttonColor: Colors.white,
                            child: RaisedButton(
                              onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                ),
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: const Text('START',
                                  style: TextStyle(fontSize: 20)),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent(
      {String image, String body, String desc, Color color, isShowImageOnTop}) {
    return Container(
      decoration: BoxDecoration(color: color),
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (!isShowImageOnTop)
            Column(
              children: [
                Center(
                  child: Image.asset(image, width: 250),
                ),
                SizedBox(height: 20),
                Text(
                  body,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      height: 1.6,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                Text(
                  desc,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ],
            ),
          if (isShowImageOnTop)
            Column(
              children: [
                Text(
                  body,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      height: 1.6,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                Text(
                  desc,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      fontWeight: FontWeight.w800,
                      color: Colors.blueGrey),
                ),
                SizedBox(height: 20),
                Center(
                  child: Image.asset(image),
                ),
              ],
            ),
        ],
      ),
    );
  }

  // ignore: missing_return
  Widget _buildPageIndicator(bool isCurrentPage) {
    if (_currentPage == 0)
      return AnimatedContainer(
        duration: Duration(milliseconds: 350),
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        height: isCurrentPage ? 10.0 : 10.0,
        width: isCurrentPage ? 18.0 : 10.0,
        decoration: BoxDecoration(
          color:
              isCurrentPage ? Color.fromRGBO(84, 45, 219, 1) : Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      );
    if (_currentPage == 1)
      return AnimatedContainer(
        duration: Duration(milliseconds: 350),
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        height: isCurrentPage ? 10.0 : 10.0,
        width: isCurrentPage ? 18.0 : 10.0,
        decoration: BoxDecoration(
          color:
              isCurrentPage ? Color.fromRGBO(232, 80, 90, 1) : Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      );
    if (_currentPage == 2)
      return AnimatedContainer(
        duration: Duration(milliseconds: 350),
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        height: isCurrentPage ? 10.0 : 10.0,
        width: isCurrentPage ? 18.0 : 10.0,
        decoration: BoxDecoration(
          color: isCurrentPage ? Color.fromRGBO(90, 46, 46, 1) : Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      );
  }
}
