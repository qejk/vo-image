Exif.DEFAULT_TAGS =
  "APP14Flags0": Match.Optional(String)
  "APP14Flags1": Match.Optional(String)
  "ApplicationRecordVersion": Match.Optional(String)
  "ApproximateFocusDistance": Match.Optional(String)
  "Artist": Match.Optional(String)
  "BrightnessValue": Match.Optional(String)
  "By-line": Match.Optional(String)
  "CFAPattern": Match.Optional(String)
  "CodedCharacterSet": Match.Optional(String)
  "ColorSpace": Match.Optional(String)
  "ColorTransform": Match.Optional(String)
  "ComponentsConfiguration": Match.Optional(String)
  "CompressedBitsPerPixel": Match.Optional(String)
  "Compression": Match.Optional(String)
  "Contrast": Match.Optional(String)
  "Copyright": Match.Optional(String)
  "CopyrightNotice": Match.Optional(String)
  "CreateDate": Match.Optional(Date)
  "Creator": Match.Optional(String)
  "CreatorTool": Match.Optional(String)
  "CustomRendered": Match.Optional(String)
  "DateCreated": Match.Optional(Date)
  "DateTimeOriginal": Match.Optional(Date)
  "DCTEncodeVersion": Match.Optional(String)
  "DerivedFromDocumentID": Match.Optional(String)
  "DerivedFromInstanceID": Match.Optional(String)
  "DerivedFromOriginalDocumentID": Match.Optional(String)
  "DigitalCreationDate": Match.Optional(Date)
  "DigitalCreationTime": Match.Optional(String)
  "DigitalZoomRatio": Match.Optional(String)
  "DisplayedUnitsX": Match.Optional(String)
  "DisplayedUnitsY": Match.Optional(String)
  "DocumentID": Match.Optional(String)
  "ExifVersion": Match.Optional(String)
  "ExposureCompensation": Match.Optional(String)
  "ExposureMode": Match.Optional(String)
  "ExposureProgram": Match.Optional(String)
  "ExposureTime": Match.Optional(String)
  "FileSource": Match.Optional(String)
  "Firmware": Match.Optional(String)
  "Flash": Match.Optional(String)
  "FlashCompensation": Match.Optional(String)
  "FlashpixVersion": Match.Optional(String)
  "FNumber": Match.Optional(String)
  "FocalLength": Match.Optional(String)
  "FocalLengthIn35mmFormat": Match.Optional(String)
  "FocalPlaneResolutionUnit": Match.Optional(String)
  "FocalPlaneXResolution": Match.Optional(String)
  "FocalPlaneYResolution": Match.Optional(String)
  "Format": Match.Optional(String)
  "GainControl": Match.Optional(String)
  "HistoryAction": Match.Optional(String)
  "HistoryChanged": Match.Optional(String)
  "HistoryInstanceID": Match.Optional(String)
  "HistoryParameters": Match.Optional(String)
  "HistorySoftwareAgent": Match.Optional(String)
  "HistoryWhen": Match.Optional(String)
  "ImageDescription": Match.Optional(String)
  "ImageHeight": Match.Optional(String)
  "ImageNumber": Match.Optional(String)
  "ImageUniqueID": Match.Optional(String)
  "ImageWidth": Match.Optional(String)
  "InstanceID": Match.Optional(String)
  "InteropIndex": Match.Optional(String)
  "InteropVersion": Match.Optional(String)
  "IPTCDigest": Match.Optional(String)
  "ISO": Match.Optional(String)
  "JFIFVersion": Match.Optional(String)
  "Keywords": Match.Optional(String)
  "Lens": Match.Optional(String)
  "LensID": Match.Optional(String)
  "LensInfo": Match.Optional(String)
  "LensMake": Match.Optional(String)
  "LensModel": Match.Optional(String)
  "LensSerialNumber": Match.Optional(String)
  "LightSource": Match.Optional(String)
  "Make": Match.Optional(String)
  "MaxApertureValue": Match.Optional(String)
  "MeasurementBacking": Match.Optional(String)
  "MeasurementFlare": Match.Optional(String)
  "MeasurementGeometry": Match.Optional(String)
  "MeasurementIlluminant": Match.Optional(String)
  "MeasurementObserver": Match.Optional(String)
  "MetadataDate": Match.Optional(String)
  "MeteringMode": Match.Optional(String)
  "Model": Match.Optional(String)
  "ModifyDate": Match.Optional(Date)
  "Orientation": Match.Optional(String)
  "OriginalDocumentID": Match.Optional(String)
  "PhotoshopThumbnail": Match.Optional(String)
  "Rating": Match.Optional(String)
  "RecommendedExposureIndex": Match.Optional(String)
  "ResolutionUnit": Match.Optional(String)
  "Rights": Match.Optional(String)
  "RunTimeEpoch": Match.Optional(String)
  "RunTimeFlags": Match.Optional(String)
  "RunTimeScale": Match.Optional(String)
  "RunTimeValue": Match.Optional(String)
  "Saturation": Match.Optional(String)
  "SceneCaptureType": Match.Optional(String)
  "SceneType": Match.Optional(String)
  "SensingMethod": Match.Optional(String)
  "SensitivityType": Match.Optional(String)
  "Sharpness": Match.Optional(String)
  "Software": Match.Optional(String)
  "SpecialInstructions": Match.Optional(String)
  "Subject": Match.Optional(String)
  "SubjectArea": Match.Optional(String)
  "SubjectDistanceRange": Match.Optional(String)
  "SubSecTime": Match.Optional(String)
  "SubSecTimeDigitized": Match.Optional(String)
  "SubSecTimeOriginal": Match.Optional(String)
  "ThumbnailLength": Match.Optional(String)
  "ThumbnailOffset": Match.Optional(String)
  "TimeCreated": Match.Optional(String)
  "Title": Match.Optional(String)
  "UserComment": Match.Optional(String)
  "ViewingCondIlluminant": Match.Optional(String)
  "ViewingCondIlluminantType": Match.Optional(String)
  "ViewingCondSurround": Match.Optional(String)
  "WhiteBalance": Match.Optional(String)
  "XMPToolkit": Match.Optional(String)
  "XResolution": Match.Optional(String)
  "YCbCrPositioning": Match.Optional(String)
  "YResolution": Match.Optional(String)

Exif.setTags(_.extend({}, Exif.DEFAULT_TAGS))