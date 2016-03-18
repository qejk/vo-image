class MyProcessor extends Exif.Processor
  process: (data) -> return data

describe 'Exif', ->
  beforeAll ->
    @processors = Exif.processors()

    @fields = {}
    @fields.date = [
      'CreateDate', 'DateCreated', 'DateTimeOriginal', 'DigitalCreationDate',
      'ModifyDate'
    ]
    @fields.string = [
      'APP14Flags0', 'APP14Flags1', 'ApplicationRecordVersion',
      'ApproximateFocusDistance', 'Artist', 'BrightnessValue', 'By-line',
      'CFAPattern', 'CodedCharacterSet', 'ColorSpace', 'ColorTransform',
      'ComponentsConfiguration', 'CompressedBitsPerPixel', 'Compression',
      'Contrast', 'Copyright', 'CopyrightNotice', 'Creator', 'CreatorTool',
      'CustomRendered', 'DCTEncodeVersion', 'DerivedFromDocumentID',
      'DerivedFromInstanceID', 'DerivedFromOriginalDocumentID',
      'DigitalCreationTime', 'DigitalZoomRatio', 'DisplayedUnitsX',
      'DisplayedUnitsY', 'DocumentID', 'ExifVersion', 'ExposureCompensation',
      'ExposureMode', 'ExposureProgram', 'ExposureTime', 'FileSource',
      'Firmware', 'Flash', 'FlashCompensation', 'FlashpixVersion', 'FNumber',
      'FocalLength', 'FocalLengthIn35mmFormat', 'FocalPlaneResolutionUnit',
      'FocalPlaneXResolution', 'FocalPlaneYResolution', 'Format',
      'GainControl', 'HistoryAction', 'HistoryChanged', 'HistoryInstanceID',
      'HistoryParameters', 'HistorySoftwareAgent', 'HistoryWhen',
      'ImageDescription', 'ImageHeight', 'ImageNumber', 'ImageUniqueID',
      'ImageWidth', 'InstanceID', 'InteropIndex', 'InteropVersion',
      'IPTCDigest', 'ISO', 'JFIFVersion', 'Keywords', 'Lens', 'LensID',
      'LensInfo', 'LensMake', 'LensModel', 'LensSerialNumber', 'LightSource',
      'Make', 'MaxApertureValue', 'MeasurementBacking', 'MeasurementFlare',
      'MeasurementGeometry', 'MeasurementIlluminant', 'MeasurementObserver',
      'MetadataDate', 'MeteringMode', 'Model', 'Orientation',
      'OriginalDocumentID', 'PhotoshopThumbnail', 'Rating',
      'RecommendedExposureIndex', 'ResolutionUnit', 'Rights', 'RunTimeEpoch',
      'RunTimeFlags', 'RunTimeScale', 'RunTimeValue', 'Saturation',
      'SceneCaptureType', 'SceneType', 'SensingMethod', 'SensitivityType',
      'Sharpness', 'Software', 'SpecialInstructions', 'Subject',
      'SubjectArea', 'SubjectDistanceRange', 'SubSecTime',
      'SubSecTimeDigitized', 'SubSecTimeOriginal', 'ThumbnailLength',
      'ThumbnailOffset', 'TimeCreated', 'Title', 'UserComment',
      'ViewingCondIlluminant', 'ViewingCondIlluminantType',
      'ViewingCondSurround', 'WhiteBalance', 'XMPToolkit', 'XResolution',
      'YCbCrPositioning', 'YResolution',
    ]

    @data =
      "APP14Flags0": "[14], Encoded with Blend=1 downsampling",
      "APP14Flags1": "(none)",
      "ApplicationRecordVersion": "4",
      "ApproximateFocusDistance": "4294967295",
      "Artist": "Peter Parker",
      "BrightnessValue": "7.66",
      "By-line": "Peter Parker",
      "CFAPattern": "[Red,Green][Green,Blue]",
      "CodedCharacterSet": "UTF8",
      "ColorSpace": "sRGB",
      "ColorTransform": "YCbCr",
      "ComponentsConfiguration": "Y, Cb, Cr, -",
      "CompressedBitsPerPixel": "2.5",
      "Compression": "JPEG (old-style)",
      "Contrast": "Normal",
      "Copyright": "Copyright 2016 Peter Parker",
      "CopyrightNotice": "Copyright 2016 Peter Parker",
      "CreateDate": new Date(),
      "Creator": "Peter Parker",
      "CreatorTool": "Adobe Photoshop Lightroom 6.4 (Windows)",
      "CustomRendered": "Normal",
      "DateCreated": new Date(),
      "DateTimeOriginal": new Date(),
      "DCTEncodeVersion": "100",
      "DerivedFromDocumentID": "xmp.did:c78390f7-cee7-1d4b-8a82-b4ae9afff50d",
      "DerivedFromInstanceID": "xmp.iid:c78390f7-cee7-1d4b-8a82-b4ae9afff50d",
      "DerivedFromOriginalDocumentID": "7C17EE9C2DED4D26B2A505D70EC1FB4B",
      "DigitalCreationDate": new Date(),
      "DigitalCreationTime": "08:34:37",
      "DigitalZoomRatio": "1",
      "DisplayedUnitsX": "inches",
      "DisplayedUnitsY": "inches",
      "DocumentID": "xmp.did:16b9564f-a579-d54d-8e4f-950eefebab0b",
      "ExifVersion": "0230",
      "ExposureCompensation": "0",
      "ExposureMode": "Manual",
      "ExposureProgram": "Manual",
      "ExposureTime": "1/640",
      "FileSource": "Digital Camera",
      "Firmware": "1.1.1",
      "Flash": "Off, Did not fire",
      "FlashCompensation": "0",
      "FlashpixVersion": "0100",
      "FNumber": "8.0",
      "FocalLength": "70.0 mm",
      "FocalLengthIn35mmFormat": "27 mm",
      "FocalPlaneResolutionUnit": "cm",
      "FocalPlaneXResolution": "2452.118652",
      "FocalPlaneYResolution": "2452.118652",
      "Format": "image/jpeg",
      "GainControl": "High gain up",
      "HistoryAction": "derived",
      "HistoryChanged": "/",
      "HistoryInstanceID": "xmp.iid:c78390f7-cee7-1d4b-8a82-b4ae9afff50d",
      "HistoryParameters": "converted from image/x-canon-cr2 to image/vnd.adobe.photoshop, saved to new location",
      "HistorySoftwareAgent": "Adobe Photoshop Lightroom 6.4 (Windows)",
      "HistoryWhen": "2016:03:15 17:13:31-05:00",
      "ImageDescription": "y u do dis?"
      "ImageHeight": "240",
      "ImageNumber": "0",
      "ImageUniqueID": "B16LSIA00SM B16LSIG03SM\n",
      "ImageWidth": "240",
      "InstanceID": "xmp.iid:16b9564f-a579-d54d-8e4f-950eefebab0b",
      "InteropIndex": "R98 - DCF basic file (sRGB)",
      "InteropVersion": "0100",
      "IPTCDigest": "7d6b654d95f04b6402edeb65c4b896a9",
      "ISO": "400",
      "Keywords": "spoderman",
      "Lens": "EF70-200mm f/4L IS USM",
      "LensID": "242",
      "LensInfo": "70-200mm f/?",
      "LensMake": "Apple",
      "LensModel": "EF70-200mm f/4L IS USM",
      "LensSerialNumber": "0000813f8c",
      "LightSource": "Unknown",
      "Make": "Canon",
      "MaxApertureValue": "4.0",
      "MeasurementBacking": "0 0 0",
      "MeasurementFlare": "0.999%",
      "MeasurementGeometry": "Unknown (0)",
      "MeasurementIlluminant": "D65",
      "MeasurementObserver": "CIE 1931",
      "MetadataDate": "2016:03:15 17:30:56-05:00",
      "MeteringMode": "Multi-segment",
      "Model": "Canon EOS 70D",
      "ModifyDate": new Date(),
      "Orientation": "Horizontal (normal)",
      "OriginalDocumentID": "7C17EE9C2DED4D26B2A505D70EC1FB4B",
      "PhotoshopThumbnail": "(Binary data 13549 bytes, use -b option to extract)",
      "Rating": "4",
      "RecommendedExposureIndex": "800",
      "ResolutionUnit": "None",
      "Rights": "Copyright 2016 Peter Parker",
      "RunTimeEpoch": "0",
      "RunTimeFlags": "Valid",
      "RunTimeScale": "1000000000",
      "RunTimeValue": "126565253003166",
      "Saturation": "Normal",
      "SceneCaptureType": "Standard",
      "SceneType": "Directly photographed",
      "SensingMethod": "One-chip color area",
      "SensitivityType": "Standard Output Sensitivity",
      "Sharpness": "Normal",
      "Software": "Adobe Photoshop Lightroom 6.4 (Windows)",
      "SpecialInstructions": "FBMD23000968010000a641000021510000036d0000f2cb0000852901000c5d01004cd801003d390200a1860200",
      "Subject": "April O'Neil",
      "SubjectArea": "1995 1189 610 612",
      "SubjectDistanceRange": "Unknown",
      "SubSecTime": "60",
      "SubSecTimeDigitized": "00",
      "SubSecTimeOriginal": "00",
      "ThumbnailLength": "13549",
      "ThumbnailOffset": "836",
      "TimeCreated": "08:34:37",
      "Title": "April O'Neil after job - if you know what I mean, wink wink.",
      "UserComment": "\nICAgTU5TIEc3IE4xIE8wLjAwIFkwLjAwIEMwLjAwIFlUMCBDVDAgUzAgIEJT\nIFMoOTApQig1MClSKDApICAgIEZNMSAgIEZDMDAwMDAwMDAwAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAA=\n",
      "ViewingCondIlluminant": "19.6445 20.3718 16.8089",
      "ViewingCondIlluminantType": "D50",
      "ViewingCondSurround": "3.92889 4.07439 3.36179",
      "WhiteBalance": "Manual",
      "XMPToolkit": "Adobe XMP Core 5.6-c011 79.156380, 2014/05/21-23:38:37",
      "XResolution": "1",
      "YCbCrPositioning": "Centered",
      "YResolution": "1",
      "JFIFVersion": "1.01"

  beforeEach ->
    Exif.setTags(_.extend({}, Exif.DEFAULT_TAGS))
    Exif.setProcessors(_.extend({}, @processors))
    @exif = new Exif(@data)

  it 'extends Space.domain.ValueObject', ->
    expect(Exif).to.extend(Space.domain.ValueObject)

  it 'is serializable', ->
    copy = EJSON.parse(EJSON.stringify(@exif))
    expect(copy.equals(@exif)).to.be.true

  describe 'immutability', ->
    it 'freezes itself', ->
      expect(Object.isFrozen(@exif)).to.be.true

  describe 'fields', ->
    it 'returns fields that correspond to added Exif tag mappings', ->
      expect(Exif::fields()).to.equal Exif.tags()

  describe 'construction', ->
    it 'it takes Exif data', ->
      expect(new Exif(@data).toPlainObject()).to.eql @data

    it 'ensures that date related Exif tags require Date values', ->
      for field in @fields.date
        data = {}
        data[field] = 'string'
        expect(-> new Exif(data)).to.throw Error

    it 'ensures that string related Exif tags require String values', ->
      for field in @fields.string
        data = {}
        data[field] = 1234
        expect(-> new Exif(data)).to.throw Error

  describe 'tags', ->
    it 'ensures that all default required Exif tags are mapped', ->
      expect(Exif.DEFAULT_TAGS).to.contain.all.keys(_.keys(@data))

    it 'sets Exif tags', ->
      tags = {"Model": String}

      Exif.setTags(tags)
      expect(Exif.tags()).to.eql tags
      expect(Exif::fields()).to.eql tags

    it 'adds Exif tag', ->
      Exif.setTags({})
      tagName = 'MyTag'

      Exif.addTag(tagName, String)
      expect(
        Exif.tags()[tagName]? and Exif.tags()[tagName] == String
      ).to.equal true
      expect(Exif.doesTagExists(tagName)).to.equal true
      expect(Exif.tagNames().length).to.equal 1

    it 'removes Exif tag', ->
      Exif.setTags({})
      tagName = 'MyTag'

      Exif.addTag(tagName, String)
      expect(Exif.removeTag(tagName))
      expect(Exif.doesTagExists(tagName)).to.equal false
      expect(Exif.tagNames().length).to.equal 0

  describe 'processing', ->

    it 'processes Exif data and converts each tag value to appropriate type if 
    its necessary', ->
      stringDate = "2016:03:15 17:30:56"
      expect(
        Exif.process({"ModifyDate": stringDate})["ModifyDate"]
      ).to.eql moment(stringDate, "YYYY:MM:DD HH:mm:SSZ ZZ").toDate()

    it 'processes field names from image processor output(like imagemagick)
    removing prefix "exif:"', ->
      unprocessedData =
        'exif:Flash': '16'
        'exif:FNumber': '63/10'
        'exif:FocalLength': '50/1'
      processedData =
        'Flash': '16'
        'FNumber': '63/10'
        'FocalLength': '50/1'

      expect(
        Exif.process(unprocessedData).toPlainObject()
      ).to.eql processedData

    it 'registers a processor', ->
      Exif.setProcessors({})

      mapping = 'MyProcessor'
      myProcessor = new MyProcessor

      Exif.registerProcessor(mapping, myProcessor)

      expect(Exif.doesProcessorExists(mapping)).to.equal true
      expect(
        _.keys(Exif.processors()).length
      ).to.equal 1

    it 'removes a processor', ->
      Exif.setProcessors({})

      mapping = 'MyProcessor'
      myProcessor = new MyProcessor

      Exif.registerProcessor(mapping, myProcessor)
      Exif.removeProcessor(mapping)

      expect(Exif.doesProcessorExists(mapping)).to.equal false
      expect(
        _.keys(Exif.processors()).length
      ).to.equal 0

    it 'throws error if tries register processor with same mapping twice', ->
      mapping = 'MyProcessor'
      myProcessor = new MyProcessor

      Exif.registerProcessor(mapping, myProcessor)
      expect(->
        Exif.registerProcessor(mapping, myProcessor)
      ).to.throw Exif.ERRORS.processorExist

    it 'throws error if tries remove processor that is not registered', ->
      expect(=>
        Exif.removeProcessor('MyProcessor')
      ).to.throw Exif.ERRORS.processorNotFound


