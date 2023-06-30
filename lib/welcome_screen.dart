import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_page/login_screen.dart';
import 'package:login_page/signup_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    foregroundColor: Color(0xFF272727),
                    side: BorderSide(color: Color(0xFF272727)),
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                  child: Text("LOGIN"),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(),
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF272727),
                    side: BorderSide(color: Color(0xFF272727)),
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                  child: Text("SIGNUP"),
                ),
              ),
            ],
          )),
    );
  }
}
