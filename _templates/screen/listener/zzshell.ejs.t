---
sh: "dart format <%= level === 'app' ? 'lib/features/app' : `lib/features/${h.changeCase.snake(feature)}` %>/ui/<%= h.changeCase.snake(name) %>/listeners"
---