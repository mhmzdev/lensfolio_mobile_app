part of '../projects.dart';

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Space.h.t16 + Space.b.t12,
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
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          // Cover Image
          if (project.imageUrl.available)
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.network(
                project.imageUrl!,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => const SizedBox.shrink(),
              ),
            ),
          // Content
          Padding(
            padding: Space.a.t16,
            child: Column(
              crossAxisAlignment: .stretch,
              children: [
                // Title
                Text(
                  project.title,
                  style: AppText.h3b,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Space.y.t08,
                // Description
                Text(
                  project.description,
                  style: AppText.b1 + AppTheme.c.subText,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                Space.y.t12,
                // Technologies
                if (project.technologies.isNotEmpty) ...[
                  Wrap(
                    spacing: SpaceToken.t08,
                    runSpacing: SpaceToken.t08,
                    children: project.technologies
                        .map(
                          (tech) => Container(
                            padding: Space.h.t08 + Space.v.t04,
                            decoration: BoxDecoration(
                              color: AppTheme.c.primary.addOpacity(0.1),
                              borderRadius: 4.radius(),
                            ),
                            child: Text(
                              tech,
                              style: AppText.l1 + AppTheme.c.primary,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Space.y.t16,
                ],
                // Action Buttons
                Row(
                  children: [
                    if (project.githubUrl.available)
                      Expanded(
                        child: AppButton(
                          icon: LucideIcons.github,
                          label: 'GitHub',
                          style: .blackBorder,
                          onTap: () => LauncherHelper.url(project.githubUrl!),
                        ),
                      ),
                    if (project.githubUrl.available &&
                        project.liveUrl.available)
                      Space.x.t08,
                    if (project.liveUrl.available)
                      Expanded(
                        child: AppButton(
                          icon: LucideIcons.external_link,
                          label: 'Live Demo',
                          onTap: () => LauncherHelper.url(project.liveUrl!),
                        ),
                      ),
                    if (project.githubUrl.available ||
                        project.liveUrl.available)
                      Space.x.t08,
                    Expanded(
                      flex:
                          project.githubUrl.available ||
                              project.liveUrl.available
                          ? 0
                          : 1,
                      child: AppButton(
                        style: .error,
                        padding: Space.a.t16,
                        icon: LucideIcons.trash_2,
                        label:
                            project.githubUrl.available ||
                                project.liveUrl.available
                            ? null
                            : 'Delete',
                        onTap: () => showDeleteProjectDialog(context, project),
                      ),
                    ),
                    Space.x.t08,
                    Expanded(
                      flex:
                          project.githubUrl.available ||
                              project.liveUrl.available
                          ? 0
                          : 1,
                      child: AppButton(
                        style: .primaryBorder,
                        padding: Space.a.t16,
                        icon: LucideIcons.pencil,
                        label:
                            project.githubUrl.available ||
                                project.liveUrl.available
                            ? null
                            : 'Edit',
                        onTap: () => AppRoutes.addProject.push(
                          context,
                          arguments: {'project': project},
                        ),
                      ),
                    ),
                  ],
                ),
                Space.y.t12,
                // Created date
                Row(
                  children: [
                    Icon(
                      LucideIcons.calendar,
                      size: 14,
                      color: AppTheme.c.subText,
                    ),
                    Space.x.t04,
                    Text(
                      'Created ${_formatDate(project.createdAt)}',
                      style: AppText.l1 + AppTheme.c.subText,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ).withBottomAnimation();
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year;
    return '$day/$month/$year';
  }
}
