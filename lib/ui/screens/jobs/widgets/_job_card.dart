part of '../jobs.dart';

class _JobCard extends StatelessWidget {
  const _JobCard({required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Space.h.t16 + Space.b.t12,
      padding: Space.a.t16,
      decoration: BoxDecoration(
        color: AppTheme.c.background,
        borderRadius: 12.radius(),
        border: Border.all(
          color: AppTheme.c.subText.addOpacity(0.15),
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.c.subText.addOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          // Header row: Title + Bookmark
          Row(
            crossAxisAlignment: .start,
            children: [
              Expanded(
                child: Text(
                  job.title,
                  style: AppText.h3b,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Space.x.t08,
              AppTouch(
                onTap: () {},
                child: Icon(
                  LucideIcons.bookmark,
                  size: SpaceToken.t24,
                  color: AppTheme.c.subText,
                ),
              ),
            ],
          ),
          Space.y.t08,
          // Company & Location row
          Row(
            children: [
              Icon(
                LucideIcons.building_2,
                size: 14,
                color: AppTheme.c.subText,
              ),
              Space.x.t04,
              Text(
                job.companyName,
                style: AppText.b2 + AppTheme.c.subText,
              ),
              if (job.candidateRequiredLocation.available) ...[
                Padding(
                  padding: Space.h.t08,
                  child: Text(
                    '•',
                    style: AppText.b2 + AppTheme.c.subText,
                  ),
                ),
                Icon(
                  LucideIcons.map_pin,
                  size: 14,
                  color: AppTheme.c.subText,
                ),
                Space.x.t04,
                Flexible(
                  child: Text(
                    job.candidateRequiredLocation!,
                    style: AppText.b2 + AppTheme.c.subText,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ],
          ),
          Space.y.t12,
          // Salary, Job Type, Posted Date row
          Row(
            children: [
              if (job.salary.available) ...[
                Expanded(
                  child: Text(
                    job.salary!,
                    style: AppText.b1b + AppTheme.c.successShade,
                  ),
                ),
              ],
              if (job.jobType.available) ...[
                Text(
                  job.jobType!,
                  style: AppText.b2 + AppTheme.c.subText,
                ),
                Space.x.t16,
              ],
              Icon(
                LucideIcons.clock,
                size: 14,
                color: AppTheme.c.subText,
              ),
              Space.x.t04,
              Text(
                _formatDate(job.publicationDate),
                style: AppText.b2 + AppTheme.c.subText,
              ),
            ],
          ),
          if (job.description.available) ...[
            Space.y.t12,
            Text(
              job.description!,
              style: AppText.b1 + AppTheme.c.subText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
          if (job.tags.available) ...[
            Space.y.t12,
            Wrap(
              spacing: SpaceToken.t08,
              runSpacing: SpaceToken.t08,
              children: job.tags!
                  .take(4)
                  .map(
                    (tag) => Text(
                      '#$tag',
                      style: AppText.l1,
                    ),
                  )
                  .toList(),
            ),
          ],
          Space.y.t16,
          // Apply Button
          AppButton(
            icon: LucideIcons.external_link,
            label: 'Apply Now',
            mainAxisSize: .max,
            onTap: () {
              // TODO: Open job.url in browser
            },
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inDays == 0) {
      return 'Today';
    } else if (diff.inDays == 1) {
      return 'Yesterday';
    } else if (diff.inDays < 7) {
      return '${diff.inDays} days ago';
    } else if (diff.inDays < 30) {
      final weeks = (diff.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else {
      final months = (diff.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    }
  }
}
