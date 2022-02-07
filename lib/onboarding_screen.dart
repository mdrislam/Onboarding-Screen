import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLast = false;
  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              if (index == 3) {
                isLast = true;
              } else {
                isLast = false;
              }
            });
          },
          children: [
            buildPage(
              color: Colors.green.shade100,
              urlImage: 'assets/images/page.jpg',
              title: 'REDUCE',
              subtitle:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            ),
            buildPage(
              color: Colors.green.shade100,
              urlImage: 'assets/images/page.jpg',
              title: 'REDUCE',
              subtitle:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            ),
            buildPage(
              color: Colors.green.shade100,
              urlImage: 'assets/images/page.jpg',
              title: 'REDUCE',
              subtitle:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            ),
            buildPage(
              color: Colors.green.shade100,
              urlImage: 'assets/images/page.jpg',
              title: 'REDUCE',
              subtitle:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => controller.jumpToPage(3),
              child: const Text('SKIP'),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 4,
                effect: WormEffect(
                    spacing: 16,
                    dotColor: Colors.black26,
                    activeDotColor: Colors.teal.shade700),
                onDotClicked: (index) => controller.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn),
              ),
            ),
            TextButton(
              onPressed: () => controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut),
              child: isLast? const Text('NEXT',style: TextStyle(color: Colors.grey),):const Text('NEXT'),
            ),
          ],
        ),
      ),
    );
  }

  Container buildPage(
      {required Color color,
      required String urlImage,
      required String title,
      required String subtitle}) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            urlImage,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          const SizedBox(
            height: 64,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.teal.shade700,
                fontSize: 32,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 64,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              subtitle,
              style: const TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
