part of '../generated_letter.dart';

class _BackAlert extends StatelessWidget {
  const _BackAlert();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Discard Letter?', style: AppText.h3b),
      content: Text(
        'Letter will be discarded if you don\'t copy it. Press \'Copy\' to save the letter to clipboard.',
        style: AppText.b1,
        textAlign: TextAlign.center,
      ),
      icon: Icon(
        LucideIcons.file_badge,
        size: SpaceToken.t32 + SpaceToken.t32,
        color: AppTheme.c.dangerBase,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context)
            ..pop() // alert
            ..pop(), // generated letter screen
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(AppTheme.c.dangerBase),
          ),
          child: const Text('Proceed'),
        ),
        TextButton(
          onPressed: () => ''.pop(context),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
