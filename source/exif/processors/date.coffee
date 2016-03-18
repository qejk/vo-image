class Exif.DateProcessor extends Exif.Processor

  format: "YYYY:MM:DD HH:mm:SSZ"
  process: (data) ->
    dateFields = @_getDateFieldsFromExifFields()

    processedData = {}
    for field, value of data
      if field in dateFields and value not instanceof Date
        processedData[field] = moment(value, @format).toDate()
      else
        processedData[field] = value

    return processedData

  _getDateFieldsFromExifFields: ->
    dateFields = []

    for field, pattern of Exif::fields()
      dateFields.push(field) if @_isDate(pattern)

    return dateFields

  _isDate: (pattern) ->
    return ((pattern.pattern? and pattern.pattern == Date) or pattern == Date)

