module.exports = {
  helpers: {
    widgetsToShell: (screen, widgets) => {
      if (!widgets || widgets.length === 0) return 'echo "No widgets to generate"';

      return widgets
        .map((key) => `hygen screen _widget ${key} --screen=${screen}`)
        .join(' && ');
    },
  },
};
