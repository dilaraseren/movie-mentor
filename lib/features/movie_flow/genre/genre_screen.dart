import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mentor/core/constants.dart';
import 'package:movie_mentor/core/failure.dart';
import 'package:movie_mentor/core/widgets/failure_screen.dart';
import 'package:movie_mentor/core/widgets/primary_button.dart';
import 'package:movie_mentor/features/movie_flow/movie_flow_controller.dart';


import 'list_card.dart';

class GenreScreen extends ConsumerWidget {
  const GenreScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pushReplacementNamed(context, "/girisYap"),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
               'Türü Seçin',
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: ref.watch(movieFlowControllerProvider).genres.when(
                    data: (genres) {
                      if (genres.isEmpty) {
                        return const FailureBody(message: 'Film Bulunamadı');
                      }

                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: kListItemSpacing),
                        itemCount: genres.length,
                        itemBuilder: (context, index) {
                          final genre = genres[index];
                          return ListCard(
                            genre: genre,
                            onTap: () => ref.read(movieFlowControllerProvider.notifier).toggleSelected(genre),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: kListItemSpacing);
                        },
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (e, s) {
                      if (e is Failure) {
                        return FailureBody(message: e.message);
                      }
                      return const FailureBody(message: 'Something went wrong on our end');
                    },
                  ),
            ),
            PrimaryButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, "/yearsBack"),
              text: 'Devam et',
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
