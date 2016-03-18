# http://www.sno.phy.queensu.ca/~phil/exiftool/TagNames/EXIF.html
# http://www.cipa.jp/std/documents/e/DC-008-2012_E.pdf
Exif = Space.domain.ValueObject.extend 'Exif',

  fields: ->
    return Exif.tags()

  Constructor: (data) ->
    Space.domain.ValueObject.call(@, data)

    Object.freeze(@)

Exif.process = (unprocessedData) ->
  processedData = unprocessedData
  for mapping, processor of Exif.processors()
    processedData = processor.process(processedData)

  allowedData = Exif._pickAllowedDataFromProcessedData(processedData)
  return new Exif(allowedData)

Exif._pickAllowedDataFromProcessedData = (processedData) ->
  return _.pick(processedData, _.keys(Exif::fields()))

Exif._processors = {}
Exif.processors = ->
  return Exif._processors

Exif.doesProcessorExists = (mapping) ->
  return (Exif._processors[mapping]?)

Exif.registerProcessor = (mapping, processor) ->
  if Exif.doesProcessorExists(mapping)
    throw new Error(Exif.ERRORS.processorExist)
  Exif._processors[mapping] = processor

Exif.setProcessors = (mappings={}) ->
  Exif._processors = mappings

Exif.removeProcessor = (mapping) ->
  unless Exif.doesProcessorExists(mapping)
    throw new Error(Exif.ERRORS.processorNotFound)
  delete Exif._processors[mapping]

Exif._tags = {}
Exif.tags = ->
  return Exif._tags

Exif.tagNames = ->
  return _.keys(Exif.tags())

Exif.setTags = (tags={}) ->
  Exif._tags = tags

Exif.doesTagExists = (tag) ->
  return (Exif._tags[tag]?)

Exif.addTag = (tag, pattern) ->
  Exif._tags[tag] = pattern unless Exif.doesTagExists(tag)

Exif.removeTag = (tag) ->
  delete Exif._tags[tag] if Exif.doesTagExists(tag)

Exif.ERRORS =
  processorExist: 'Processor is already registered'
  processorNotFound: 'Processor is not registered'
