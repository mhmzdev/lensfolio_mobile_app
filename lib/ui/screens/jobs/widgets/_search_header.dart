part of '../jobs.dart';

class _SearchHeader extends StatelessWidget {
  const _SearchHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.a.t16,
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,

        children: [
          Text(
            'Remote Jobs',
            style: AppText.h1b,
          ),
          Space.y.t08,
          AppFormTextInput(
            name: 'search',
            placeholder: 'Search jobs, companies, etc.',
            textInputAction: TextInputAction.search,
            onFieldSubmitted: (query) {
              JobsCubit.c(context).fetch(search: query);
            },
          ),
        ],
      ),
    );
  }
}
