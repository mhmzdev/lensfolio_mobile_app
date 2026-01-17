import 'package:html/parser.dart' as html_parser;

class HtmlParser {
  static String parse(String html) {
    final document = html_parser.parse(html);
    return document.body?.text ?? '';
  }
}
