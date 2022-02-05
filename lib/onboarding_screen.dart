import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
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
          children: [
            Container(
              color: Colors.red,
              child: const Center(
                child: Text('Page 1'),
              ),
            ),
            Container(
              color: Colors.green,
              child: const Center(
                child: Text('Page 2'),
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 85, 69, 238),
              child: const Center(
                child: Text('Page 3'),
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 27, 176, 245),
              child: const Center(
                child: Text('Page 4'),
              ),
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
              ),
            ),
            TextButton(
              onPressed: () => controller.nextPage(
                  duration: const Duration(microseconds: 500),
                  curve: Curves.bounceInOut),
              child: const Text('NEXT'),
            ),
          ],
        ),
      ),
    );
  }
}
