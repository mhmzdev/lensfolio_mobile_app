---
inject: true
after: "import 'package:lensfolio_mobile_app/utils/flash.dart';"
to: "lib/ui/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart"
skip_if: part 'listeners/_<%= h.changeCase.snake(arg.state) %>.dart';
---

part 'listeners/_<%= h.changeCase.snake(arg.state) %>.dart';
