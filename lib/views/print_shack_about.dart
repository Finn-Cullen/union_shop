import 'package:flutter/material.dart';
import 'package:union_shop/models/navigation.dart';

class PrintPageAbout extends StatelessWidget {
  const PrintPageAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 600;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Navbar(),
              SizedBox(
                width: double.infinity,
                height: isMobile ? 360 : 550,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('The Union Print Shack', style: TextStyle(fontSize: isMobile ? 18 : 20)),
                    const Text('Make It Yours at The Union Print ShackWant to add a personal touch? We’ve got you covered with heat-pressed customisation on all our clothing. Swing by the shop - our team’s always happy to help you pick the right gear and answer any questions.'),
                    const Text('Uni Gear or Your Gear - We’ll Personalise ItWhether you’re repping your university or putting your own spin on a hoodie you already own, we’ve got you covered. We can personalise official uni-branded clothing and your own items - just bring them in and let’s get creative!'),
                    const Text('Simple Pricing, No SurprisesCustomising your gear won’t break the bank - just £3 for one line of text or a small chest logo, and £5 for two lines or a large back logo. Turnaround time is up to three working days, and we’ll let you know as soon as it’s ready to collect.'),
                    const Text('Personalisation Terms & ConditionsWe will print your clothing exactly as you have provided it to us, whether online or in person. We are not responsible for any spelling errors. Please ensure your chosen text is clearly displayed in either capitals or lowercase. Refunds are not provided for any personalised items.'),
                    const Text('Ready to Make It Yours?Pop in or get in touch today - let’s create something uniquely you with our personalisation service - The Union Print Shack!'),
                  ],
                ),
              ),
              const Footer(),
            ],
          ),
        ),
      );
    });
  }
}
