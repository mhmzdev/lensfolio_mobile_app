---
inject: true
to: lib/router/router.dart
after: // imports
skip_if: "<%= level === 'app' ? 'features/app' : `features/${h.changeCase.snake(feature)}` %>/ui/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart"
---
import 'package:lensfolio_mobile_app/<%= level === 'app' ? 'features/app' : `features/${h.changeCase.snake(feature)}` %>/ui/<%= h.changeCase.snake(name) %>/<%= h.changeCase.snake(name) %>.dart';