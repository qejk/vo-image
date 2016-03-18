class Exif.RemoveExifPrefixFromFieldsProcessor extends Exif.Processor

  process: (data) ->
    cleanedDataFromPrefixed = {}
    for field, value of data
      if field.indexOf('exif:') > -1
        cleanedDataFromPrefixed[field.replace('exif:', '')] = value
      else
        cleanedDataFromPrefixed[field] = value
    return cleanedDataFromPrefixed
