part of '../home.dart';

class _TechStackCard extends StatelessWidget {
  const _TechStackCard();

  @override
  Widget build(BuildContext context) {
    final userData = context.userData!;

    return Container(
      padding: Space.a.t16,
      decoration: AppProps.softBoxDecoration,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            'Tech Stack',
            style: AppText.h2b,
          ),
          Space.y.t12,
          ...userData.techStack.map(
            (stack) => Padding(
              padding: Space.b.t08,
              child: _TechStackRow(
                category: stack.category.name.titleCase,
                technologies: stack.technologies,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TechStackRow extends StatelessWidget {
  const _TechStackRow({
    required this.category,
    required this.technologies,
  });

  final String category;
  final List<String> technologies;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .start,
      children: [
        Text(
          '$category: ',
          style: AppText.b1b,
        ),
        Expanded(
          child: Text(
            technologies.join(', '),
            style: AppText.b1.w(5) + AppTheme.c.subText,
          ),
        ),
      ],
    );
  }
}
