---
inject: true
before: part
to: "<%= level === 'app' ? 'lib/features/app' : `lib/features/${h.changeCase.snake(feature)}` %>/ui/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart"
skip_if: utils/flash.dart
---
import 'package:lensfolio_mobile_app/utils/flash.dart';