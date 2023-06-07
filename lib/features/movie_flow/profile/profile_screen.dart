
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_mentor/core/constants.dart';
import 'package:movie_mentor/core/widgets/profile_wdiget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void signUserOut() {
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, "/loginPage");
    }

    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, "/girisYap"),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        ExactAssetImage('assets/images/profil-yok.png'),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Constants.primaryColor.withOpacity(.5),
                      width: 5.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: size.width * .3,
                  child: Row(
                    children: [
                      Center(
                        child: Text(
                          ' Dilara Seren',
                          style: TextStyle(
                            color: Constants.blackColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(),
                    ],
                  ),
                ),
                Text(
                  'dilaraseren@gmail.com',
                  style: TextStyle(
                    color: Constants.blackColor.withOpacity(.3),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: size.height * .7,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProfileWidget(
                          icon: Icons.bar_chart,
                          title: 'İstatiksel Veriler',
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, "/line_chart");
                          }),
                      ProfileWidget(
                          icon: Icons.chat,
                          title: 'Sıkça Sorulan Sorular',
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, "/faq_page");
                          }),
                      ProfileWidget(
                        icon: Icons.logout,
                        title: 'Çıkış Yap',
                        onTap: signUserOut,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
} 