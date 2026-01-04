// see types of prompts:
// https://github.com/enquirer/enquirer/tree/master/examples
//
const inputs = require('../../js/inputs');

module.exports = [
  inputs.blocLevel,
  inputs.featureName,
  {
    type: 'confirm',
    name: 'formData',
    default: false,
    message: 'Do you want Dev data for forms with new screen ?',
  },
  {
    type: 'input',
    name: 'formKeys',
    message: 'Write the name of form keys in comma separated values.',
    result: (data) => {
      if (!data) return [];
      const parsed = data.split(',');
      return parsed;
    },
  },
  {
    type: 'input',
    name: 'widgets',
    message: 'Write the name of widgets in comma separated values.',
    result: (data) => {
      if (!data) return [];
      const parsed = data.split(',');
      return parsed;
    },
  },
];


