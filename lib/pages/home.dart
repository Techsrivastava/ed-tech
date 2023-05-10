import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:leaning_app/pages/about.dart';
import 'package:leaning_app/pages/assigments.dart';
import 'package:leaning_app/pages/dashboard.dart';
import 'package:leaning_app/pages/language.dart';
import 'package:leaning_app/pages/leaderboard.dart';
import 'package:leaning_app/pages/live.dart';
import 'package:leaning_app/pages/plan.dart';
import 'package:leaning_app/pages/profile.dart';
import 'package:leaning_app/pages/quizz.dart';
import 'package:leaning_app/pages/setting.dart';
import 'package:leaning_app/widgets/mydrawer.header.dart';
import 'package:sidebarx/sidebarx.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.aboutus) {
      container = AboutUsPage();
    } else if (currentPage == DrawerSections.profile) {
      container = ProfilePage();
    } else if (currentPage == DrawerSections.liveclass) {
      container = LiveClassesPage();
    } else if (currentPage == DrawerSections.quizz) {
      container = QuizPage();
    } else if (currentPage == DrawerSections.performance) {
      container = LeaderboardPage();
    } else if (currentPage == DrawerSections.languages) {
      container = LanguagePage();
    } else if (currentPage == DrawerSections.membership) {
      container = ChoosePlanPage();
    } else if (currentPage == DrawerSections.profile) {
      container = ProfilePage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.assignment) {
      container = AssignmentPage();
    } 

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 211, 163, 0.9),
        title: Text("Rapid Tech"),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "About us", Icons.people_alt_outlined,
              currentPage == DrawerSections.aboutus ? true : false),
          menuItem(3, "Profile", Icons.policy_rounded,
              currentPage == DrawerSections.profile ? true : false),
          menuItem(4, "Live Classes", Icons.live_tv,
              currentPage == DrawerSections.profile ? true : false),
          menuItem(5, "Qizz", Icons.quiz,
              currentPage == DrawerSections.profile ? true : false),
          menuItem(6, "Performance", Icons.event,
              currentPage == DrawerSections.performance ? true : false),
          menuItem(7, "Languages", Icons.language,
              currentPage == DrawerSections.languages ? true : false),
          menuItem(8, "Membership Plan", Icons.card_membership,
              currentPage == DrawerSections.membership ? true : false),
          menuItem(9, "Assignments ", Icons.assessment,
              currentPage == DrawerSections.assignment ? true : false),
          Divider(),
          menuItem(10, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(11, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          Divider(),
          menuItem(12, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true : false),
          menuItem(13, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
          menuItem(14, "Send feedback", Icons.assignment,
              currentPage == DrawerSections.assignment ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.aboutus;
            } else if (id == 3) {
              currentPage = DrawerSections.profile;
            } else if (id == 4) {
              currentPage = DrawerSections.liveclass;
            } 
            else if (id == 5) {
              currentPage = DrawerSections.quizz;
            } 
            else if (id == 6) {
              currentPage = DrawerSections.performance;
            } else if (id == 7) {
              currentPage = DrawerSections.languages;
            }
             else if (id == 8) {
              currentPage = DrawerSections.membership;
            } 
             else if (id == 9) {
              currentPage = DrawerSections.assignment;
            } 
            else if (id == 10) {
              currentPage = DrawerSections.settings;
            } else if (id == 11) {
              currentPage = DrawerSections.notifications;
            } else if (id == 12) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 13) {
              currentPage = DrawerSections.send_feedback;
            } else if (id == 14) {
              currentPage = DrawerSections.assignment;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  aboutus,
  profile,
  performance,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
  membership,
  languages,
  liveclass,
  quizz, assignment,
}
