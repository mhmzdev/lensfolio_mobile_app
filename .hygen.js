module.exports = {
  helpers: {
    widgetsToShell: (screen, widgets, level, feature) => {
      if (!widgets || widgets.length === 0) return 'echo "No widgets to generate"';

      return widgets
        .map((key) => `hygen screen _widget ${key} --screen=${screen} --level=${level} --feature=${feature || 'app'}`)
        .join(' && ');
    },
  },
};
