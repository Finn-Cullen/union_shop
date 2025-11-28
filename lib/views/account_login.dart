import 'package:flutter/material.dart';
import 'package:union_shop/models/navigation.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 600;
      final containerSize = isMobile ? 320.0 : 400.0;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Navbar(),
              SizedBox(
                height: isMobile ? 560 : 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: containerSize,
                        height: containerSize,
                        color: Colors.white70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              // union logo
                              'assets/images/logo.png',
                              height: isMobile ? 32 : 40,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              'Sign in',
                              style: TextStyle(fontSize: isMobile ? 28 : 40),
                            ),
                            const Text('choose how you would like to sign in'),
                            ElevatedButton(
                              onPressed: placeholderCallbackForButtons,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 62, 11, 172),
                              ),
                              child: const Text(
                                'sign in with shop',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            const Text(
                                '-------------------------------or-------------------------------'),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0),
                              child: TextField(
                                  decoration:
                                      InputDecoration(labelText: 'Email')),
                            ),
                            ElevatedButton(
                              onPressed: placeholderCallbackForButtons,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 198, 198, 198),
                              ),
                              child: const Text(
                                'continue',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 87, 87, 87)),
                              ),
                            ),
                          ],
                        ))
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
