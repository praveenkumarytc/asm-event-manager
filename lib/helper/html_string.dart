import 'package:html/parser.dart';

class HtmlTags {
  String removeTag(htmlString) {
    if (htmlString == null) {
      return '';
    }
    var document = parse(htmlString);
    String parsedString = parse(document.body?.text).documentElement!.text;
    return parsedString;
  }
}
