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
    // Exif
    'source/exif/exif.coffee',
    'source/exif/processor.coffee',
    'source/exif/processors/date.coffee',
    'source/exif/processors/remove-exif-prefix-from-fields.coffee',
    'source/exif/exif-tags.coffee',
    'source/exif/config.coffee',
    // IPTC
    'source/iptc/iptc.coffee',
    'source/iptc/processor.coffee',
    'source/iptc/iptc-schema.coffee',
    'source/iptc/processors/imagemagick.coffee',
    'source/iptc/config.coffee',
    // Image Variant
    'source/image/image-variant.coffee',
    // Picture
    'source/picture/picture.coffee',
  ]);

  api.export('Exif');
  api.export('IPTC');
  api.export('ImageVariant');
  api.export('Picture');
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
    'tests/exif.unit.coffee',
    'tests/iptc.unit.coffee',
    'tests/image-variant.unit.coffee',
    'tests/picture.unit.coffee'
  ]);
});