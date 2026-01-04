---
inject: true
before: part
to: "lib/ui/screens/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart"
skip_if: lensfolio_mobile_app/utils/flash.dart
---
import 'package:lensfolio_mobile_app/utils/flash.dart';
