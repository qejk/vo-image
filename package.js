Package.describe({
  name: 'radiant:vo-image',
  summary: 'Value Objects for image domains',
  version: '0.1.0',
});

Package.onUse(function (api) {
  api.versionsFrom('1.2.1');

  api.use([
    'coffeescript',
    'underscore',
    'check',
    'space:domain@0.2.1',
    'momentjs:moment@2.10.6',
    'radiant:vo-web@0.1.0',
    'radiant:vo-file@0.1.0',
  ]);

  api.addFiles([
  ]);
});


Package.onTest(function(api) {

  api.use([
    'check',
    'ejson',
    'coffeescript',
    'underscore',
    'radiant:vo-image',
    'momentjs:moment@2.10.6',
    'space:domain@0.2.1',
    'practicalmeteor:munit@2.1.5',
    'space:testing@3.0.1',
    'space:testing-messaging@3.0.1'
  ]);

  api.addFiles([
  ]);
});