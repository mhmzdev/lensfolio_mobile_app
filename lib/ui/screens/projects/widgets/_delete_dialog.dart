part of '../projects.dart';

class _DeleteProjectDialog extends StatelessWidget {
  const _DeleteProjectDialog({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, ProjectsState>(
      buildWhen: (a, b) => a.delete != b.delete,
      builder: (context, state) {
        final isLoading = state.delete.isLoading;

        return AlertDialog(
          title: Text('Delete Project?', style: AppText.h3b),
          content: Text(
            'Are you sure you want to delete "${project.title}"? This action cannot be undone.',
            style: AppText.b1,
            textAlign: TextAlign.center,
          ),
          icon: Icon(
            LucideIcons.trash_2,
            size: SpaceToken.t32 + SpaceToken.t32,
            color: AppTheme.c.dangerBase,
          ),
          actions: [
            TextButton(
              onPressed: isLoading ? null : () => ''.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: isLoading
                  ? null
                  : () {
                      ProjectsCubit.c(context).delete(
                        project.id,
                        imageUrl: project.imageUrl,
                      );
                    },
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(AppTheme.c.dangerBase),
              ),
              child: isLoading
                  ? SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppTheme.c.dangerBase,
                      ),
                    )
                  : const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}

/// Shows the delete confirmation dialog.
void showDeleteProjectDialog(BuildContext context, Project project) {
  showDialog(
    context: context,
    routeSettings: const RouteSettings(name: '/projects/delete-dialog'),
    builder: (_) => _DeleteProjectDialog(project: project),
  );
}
