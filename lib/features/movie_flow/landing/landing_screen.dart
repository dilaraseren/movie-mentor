import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mentor/core/constants.dart';
import 'package:movie_mentor/core/widgets/primary_button.dart';



class LandingScreen extends ConsumerWidget {
  const LandingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
     appBar:AppBar( 
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/profile_page");
              },
      ),
      ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Bugün ne izleyelim ?',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Image.asset('assets/images/banner.webp'),
            const Spacer(),
            PrimaryButton(
                   onPressed: () => Navigator.pushReplacementNamed(context, "/turDevam"),
              text: 'Hadi başlayalım',
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
