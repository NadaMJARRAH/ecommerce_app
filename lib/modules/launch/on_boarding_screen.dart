import 'package:ecommerce_app/widgets/on_boarding_content.dart';
import 'package:ecommerce_app/widgets/page_view_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // if(_currentPage < 2 )
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Visibility(
                visible: _currentPage < 2,
                replacement: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login_screen');
                  },
                  child: Text(
                    'START',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF272459),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    _pageController.animateToPage(2,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOutBack);
                  },
                  child: Text(
                    'SKIP',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF272459),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            // if(_currentPage == 2)
            //   Align(
            //     alignment: AlignmentDirectional.centerEnd,
            //     child: TextButton(
            //       onPressed: () {
            //       },
            //       child: Text(
            //         'START',
            //         style: GoogleFonts.poppins(
            //           color: Color(0xFF272459),
            //           fontWeight: FontWeight.bold,
            //           fontSize: 16,
            //         ),
            //       ),
            //     ),
            //   ),
            Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int currentPage) {
                  print('Current Page : $currentPage');
                  setState(() {
                    _currentPage = currentPage;
                  });
                },
                children: const [
                  // Container(
                  //   color: Colors.green,
                  //   child: Text('container 1'),
                  // ),
                  // Container(
                  //   color: Colors.yellow,
                  //   child: Text('container 2'),
                  // ),
                  // Container(
                  //   color: Colors.orange,
                  //   child: Text('container 3'),
                  // ),
                  OnboardingContent(
                      image: 'onboarding_1',
                      title: 'Online Shopping',
                      subTitle:
                          'Buy anything you need anywhere and anytime with the guarantee of the best goods.'),
                  OnboardingContent(
                      image: 'onboarding_2',
                      title: 'An Affordable Price',
                      subTitle:
                          'we have very cheap prices with easy and simple transactions'),
                  OnboardingContent(
                      image: 'onboarding_3',
                      title: 'Tracking your Shipments',
                      subTitle:
                          'Use the tracking system feature to get information about the courier on the map'),
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     TabPageSelectorIndicator(
            //         backgroundColor: _currentPage == 0
            //             ? const Color(0xFFF35C56)
            //             : const Color(0xFFE4E4E6),
            //         borderColor: Colors.transparent,
            //         size: 10),
            //     TabPageSelectorIndicator(
            //         backgroundColor: _currentPage == 1
            //             ? const Color(0xFFF35C56)
            //             : const Color(0xFFE4E4E6),
            //         borderColor: Colors.transparent,
            //         size: 10),
            //     TabPageSelectorIndicator(
            //         backgroundColor: _currentPage == 2
            //             ? const Color(0xFFF35C56)
            //             : const Color(0xFFE4E4E6),
            //         borderColor: Colors.transparent,
            //         size: 10),
            //   ],
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PageViewIndicator(
                  isCurrentPage: _currentPage == 0,
                  marginEnd: 8,
                ),
                PageViewIndicator(
                  isCurrentPage: _currentPage == 1,
                  marginEnd: 8,
                ),
                PageViewIndicator(
                  isCurrentPage: _currentPage == 2,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      if (_currentPage > 0) {
                        _pageController.previousPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOutBack);
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_circle_left_rounded,
                      color: Color(0xFFF35C56),
                      size: 32,
                    )),
                IconButton(
                    onPressed: () {
                      if (_currentPage < 2) {
                        _pageController.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOutBack);
                      }
                    },
                    icon: const Icon(
                      Icons.arrow_circle_right_rounded,
                      color: Color(0xFFF35C56),
                      size: 32,
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: _currentPage == 2,
              maintainSize: true,
              maintainState: true,
              maintainAnimation: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: const LinearGradient(
                        begin: AlignmentDirectional.topStart,
                        end: AlignmentDirectional.bottomEnd,
                        colors: [
                          Color(0xFF272459),
                          Color(0xFFF35C56),
                        ],
                      ),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 5,
                            color: Colors.black45,
                            offset: Offset(0, 4))
                      ]),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      minimumSize: const Size(double.infinity, 48),
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(24),
                      // ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login_screen');
                    },
                    child: Text(
                      'Getting Started',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
