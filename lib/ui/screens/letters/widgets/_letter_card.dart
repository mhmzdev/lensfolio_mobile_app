part of '../letters.dart';

class _LetterCard extends StatelessWidget {
  final CoverLetter letter;

  const _LetterCard({required this.letter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 12.sp()),
      child: Container(
        padding: Space.a.t16,
        decoration: BoxDecoration(
          color: AppTheme.c.background,
          borderRadius: 12.radius(),
          border: Border.all(
            color: AppTheme.c.subText.addOpacity(0.15),
          ),
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            // Header with company and menu
            Row(
              children: [
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      letter.letter.companyName ?? '',
                      style: AppText.h3b,
                    ),
                    Text(
                      letter.letter.position ?? '',
                      style: AppText.b2 + AppTheme.c.subText,
                    ),
                  ],
                ),
              ],
            ),

            // Job description (if available)
            if (letter.letter.letterBody != null) ...[
              Space.y.t12,
              Text(
                letter.letter.letterBody!,
                style: AppText.b2,
                maxLines: 4,
                overflow: .ellipsis,
              ),
            ],

            Space.y.t16,

            // Date info
            Row(
              children: [
                Icon(
                  LucideIcons.calendar,
                  size: SpaceToken.t16,
                  color: AppTheme.c.subText,
                ),
                Space.x.t04,
                Text(
                  'Created ${_formatDate(letter.createdAt)}',
                  style: AppText.b2 + AppTheme.c.subText,
                ),
                if (letter.updatedAt != null &&
                    letter.createdAt != letter.updatedAt) ...[
                  Space.x.t08,
                  Text(
                    '•',
                    style: AppText.b2 + AppTheme.c.subText,
                  ),
                  Space.x.t08,
                  Text(
                    'Updated ${_formatDate(letter.updatedAt!)}',
                    style: AppText.b2 + AppTheme.c.subText,
                  ),
                ],
              ],
            ),

            Space.y.t16,

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: 'Edit',
                    style: .primaryBorder,
                    icon: LucideIcons.pencil,
                    mainAxisSize: .max,
                    size: .small,
                    onTap: () {},
                  ),
                ),
                Space.x.t08,
                Expanded(
                  child: AppButton(
                    label: 'Copy',
                    style: .primaryBorder,
                    icon: LucideIcons.copy,
                    mainAxisSize: .max,
                    size: .small,
                    onTap: () async {
                      await Clipboard.setData(
                        ClipboardData(text: letter.letter.letterBody!),
                      );
                      if (!context.mounted) return;
                      UIFlash.success(context, 'Letter copied to clipboard');
                    },
                  ),
                ),
                Space.x.t08,
                BlocBuilder<CoverLetterCubit, CoverLetterState>(
                  buildWhen: (prev, curr) => prev.delete != curr.delete,
                  builder: (context, state) {
                    final loading = state.delete.isLoading;
                    return AppButton(
                      style: .error,
                      icon: LucideIcons.trash_2,
                      size: .small,
                      state: loading ? .disabled : .def,
                      onTap: () =>
                          CoverLetterCubit.c(context).delete(letter.id),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Format date to relative time
  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        if (difference.inMinutes == 0) {
          return 'just now';
        }
        return '${difference.inMinutes}m ago';
      }
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '${weeks}w ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '${months}mo ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '${years}y ago';
    }
  }
}
