part of '../../jobs.dart';

class _ExpandableDescription extends StatefulWidget {
  const _ExpandableDescription({
    required this.description,
    required this.url,
  });

  final String description;
  final String url;

  @override
  State<_ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<_ExpandableDescription> {
  static const int _maxLines = 3;

  late final TapGestureRecognizer _tapRecognizer;

  @override
  void initState() {
    super.initState();
    _tapRecognizer = TapGestureRecognizer()
      ..onTap = () => LauncherHelper.url(widget.url);
  }

  @override
  void dispose() {
    _tapRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final text = HtmlParser.parse(widget.description);
    final style = AppText.b1 + AppTheme.c.subText;

    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(text: text, style: style),
          maxLines: _maxLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final hasOverflow = textPainter.didExceedMaxLines;

        if (!hasOverflow) {
          return Text(text, style: style);
        }

        return Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: _getTruncatedText(text, constraints.maxWidth),
                style: style,
              ),
              TextSpan(
                text: ' see more...',
                style: AppText.b1b + AppTheme.c.primary,
                recognizer: _tapRecognizer,
              ),
            ],
          ),
          maxLines: _maxLines,
        );
      },
    );
  }

  /// Truncates text to fit within maxLines while leaving room for "see more...".
  String _getTruncatedText(String text, double maxWidth) {
    const seeMore = ' see more...';
    final seeMorePainter = TextPainter(
      text: TextSpan(text: seeMore, style: AppText.b1b),
      textDirection: TextDirection.ltr,
    )..layout();

    final availableWidth = maxWidth - seeMorePainter.width;
    var truncated = text;

    final painter = TextPainter(
      text: TextSpan(text: truncated, style: AppText.b1 + AppTheme.c.subText),
      maxLines: _maxLines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);

    final lastLineEnd = painter.getPositionForOffset(
      Offset(availableWidth, painter.height - 1),
    );

    if (lastLineEnd.offset < truncated.length) {
      truncated = truncated.substring(0, lastLineEnd.offset).trimRight();
      // Clean trailing punctuation
      while (truncated.isNotEmpty &&
          (truncated.endsWith('.') ||
              truncated.endsWith(',') ||
              truncated.endsWith(' '))) {
        truncated = truncated.substring(0, truncated.length - 1);
      }
    }

    return truncated;
  }
}
