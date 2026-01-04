const dataModelName = {
  type: 'input',
  name: 'model',
  message: "Write consumable model name"
};

const nestedModule = {
  type: 'input',
  name: 'args',
  message: 'Write args in module:model in comma separated values',
  result: (data) => {
    return data.split(',').map((v) => {
      const split = v.split(':');
      return {
        module: split[0],
        model: split[1],
        state: split[2],
      };
    });
  },
};

const screenName = {
  type: 'input',
  name: 'screen',
  message: 'Enter the screen name!',
};

const screenCrudUI = {
  type: 'input',
  name: 'arg',
  message: 'Write args in bloc:module:state format',
  result: (data) => {
    const split = data.split(':');
    return {
      bloc: split[0],
      module: split[1],
      state: split[2],
    };
  },
};

const blocLevel = {
  type: 'select',
  name: 'level',
  message: 'Is this an app-level or feature-level bloc?',
  choices: ['app', 'feature'],
};

const featureName = {
  type: 'input',
  name: 'feature',
  message: 'Enter the feature name (e.g., auth, rallies) [Press Enter to skip for app-level]:',
  initial: 'app',
  result: (value) => {
    // If empty or whitespace, default to 'app'
    return (value || '').trim() || 'app';
  },
};

const appType = {
  type: 'select',
  name: 'appType',
  message: 'Which app(s) should this bloc be created for?',
  choices: ['both', 'fan_app', 'driver_app'],
};

module.exports = { 
  dataModelName, 
  nestedModule, 
  screenName, 
  screenCrudUI,
  blocLevel,
  featureName,
  appType,
};