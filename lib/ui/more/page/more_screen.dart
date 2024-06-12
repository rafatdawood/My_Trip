import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hogozat/core/shared_preferences.dart';
import 'package:hogozat/ui/login/page/login_screen.dart';
import '../../about_us/page/about_us_screen.dart';
import '../../contact_us/page/contact_us_screen.dart';
import '../../notifications/page/notifications_screen.dart';
import '../../our_busses/page/our_busses_screen.dart';
import '../../our_services/page/our_services_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              children: [
                Text(
                  "More",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Rafaat Dawood",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17)),
                        Text("0123456789",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17)),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ))
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: AnimationLimiter(
                child: AnimationConfiguration.staggeredList(
                  position: count += 1,
                  duration: Duration(milliseconds: 200),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: ListView(
                        children: [
                          InkWell(
                            onTap: () => navToNotificationsScreen(),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: Color(0xfff0f3ff),
                              ),
                              height: 50,
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                "Notifications",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: Color(0xfff0f3ff),
                              ),
                              height: 50,
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                "Language",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () => navToContactUsScreen(),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: Color(0xfff0f3ff),
                              ),
                              height: 50,
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                "Contact Us",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () => navToAboutUsScreen(),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: Color(0xfff0f3ff),
                              ),
                              height: 50,
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                "About Us",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () => navToOurBussesScreen(),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: Color(0xfff0f3ff),
                              ),
                              height: 50,
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                "Our Busses",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () => navToOurServicesScreen(),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: Color(0xfff0f3ff),
                              ),
                              height: 50,
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                "Our Services",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: Color(0xfff0f3ff),
                              ),
                              height: 50,
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                "Terms & Conditions",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: Color(0xfff0f3ff),
                              ),
                              height: 50,
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                "FAQs",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () => logout(),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: Color(0xfff0f3ff),
                              ),
                              height: 50,
                              alignment: AlignmentDirectional.center,
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  navToNotificationsScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsScreen(),));
  }

  navToContactUsScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsScreen(),));
  }
  navToAboutUsScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsScreen()));
  }

  navToOurServicesScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => OurServicesScreen()));
  }

  navToOurBussesScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => OurBussesScreen()));
  }

  logout() async {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
    // Remove data for the 'counter' key.
    await FirebaseAuth.instance.signOut();
    PreferenceUtils.setBool(PrefKeys.loggedIn, false);
    PreferenceUtils.setString(PrefKeys.uid, '');
  }
}
