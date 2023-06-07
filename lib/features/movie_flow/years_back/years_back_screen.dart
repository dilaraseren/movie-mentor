import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mentor/core/constants.dart';
import 'package:movie_mentor/core/widgets/primary_button.dart';
import 'package:movie_mentor/features/movie_flow/movie_flow_controller.dart';
import 'package:movie_mentor/features/movie_flow/result/result_screen.dart';



class YearsBackScreen extends ConsumerWidget {
  const YearsBackScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
     appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pushReplacementNamed(context, "/turDevam"),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Kaç yıl öncesine bakmalıyız?',
              style: theme.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${ref.watch(movieFlowControllerProvider).yearsBack}',
                  style: theme.textTheme.headlineSmall,
                ),
                Text(
                  'Yıl Önce',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: theme.textTheme.headlineMedium?.color?.withOpacity(0.62),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Slider(
              onChanged: (value) {
                ref.read(movieFlowControllerProvider.notifier).updateYearsBack(value.toInt());
              },
              value: ref.watch(movieFlowControllerProvider).yearsBack.toDouble(),
              min: 0,
              max: 70,
              divisions: 70,
              label: '${ref.watch(movieFlowControllerProvider).yearsBack}',
            ),
            const Spacer(),
            PrimaryButton(
              onPressed: () async {
                await ref.read(movieFlowControllerProvider.notifier).getRecommendedMovie();
                Navigator.of(context).push(ResultScreen.route());
              },
              isLoading: ref.watch(movieFlowControllerProvider).movie is AsyncLoading,
              text: 'Süper,Haydi!',
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
