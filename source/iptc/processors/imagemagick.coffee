class IPTC.ImagemagickProcessor extends IPTC.Processor

  imagemagickIIMFieldPattern: /\[[0-9]+,([0-9]+)\]/
  process: (data) ->
    iimExtractedFieldsMappings = {}
    for field, value of data
      suffix = @imagemagickIIMFieldPattern.exec(field)
      if suffix and suffix.length > 1
        iimExtractedFieldsMappings[suffix[1]] = value

    processedData = {}
    for field, spec of IPTC.schema()
      if iimExtractedFieldsMappings[spec.iimField]?
        processedData[field] = iimExtractedFieldsMappings[spec.iimField]
      else
        processedData[field] = data[field] if data[field]?

    return processedData
