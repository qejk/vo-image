# https://www.iptc.org/std/photometadata/documentation/GenericGuidelines/index.htm#!Documents/fieldreferencetable.htm
# https://www.iptc.org/std/Iptc4xmpCore/1.0/documentation/Iptc4xmpCore_1.0-doc-CpanelsUserGuide_13.pdf
# http://www.vcode.no/web/resource.nsf/ii2lnug/643.htm
# http://www.photometadata.org/meta-resources-field-guide-to-metadata
# https://cs.wikipedia.org/wiki/IPTC
IPTC = Space.domain.ValueObject.extend 'IPTC',

  fields: ->
    return IPTC.schemaMappings()

  Constructor: (data) ->
    Space.domain.ValueObject.call(@, data)

    Object.freeze(@)

IPTC.process = (unprocessedData) ->
  processedData = unprocessedData
  for mapping, processor of IPTC.processors()
    processedData = processor.process(processedData)

  allowedData = IPTC._pickAllowedDataFromProcessedData(processedData)
  return new IPTC(allowedData)

IPTC._pickAllowedDataFromProcessedData = (processedData) ->
  return _.pick(processedData, _.keys(IPTC::fields()))

IPTC._processors = {}
IPTC.processors = ->
  return IPTC._processors

IPTC.doesProcessorExists = (mapping) ->
  return (IPTC._processors[mapping]?)

IPTC.registerProcessor = (mapping, processor) ->
  if IPTC.doesProcessorExists(mapping)
    throw new Error(IPTC.ERRORS.processorExist)
  IPTC._processors[mapping] = processor

IPTC.setProcessors = (mappings={}) ->
  IPTC._processors = mappings

IPTC.removeProcessor = (mapping) ->
  unless IPTC.doesProcessorExists(mapping)
    throw new Error(IPTC.ERRORS.processorNotFound)
  delete IPTC._processors[mapping]

IPTC._schema = {}
IPTC.schema = ->
  return IPTC._schema

IPTC.fieldNames = ->
  return _.keys(IPTC.schema())

IPTC.schemaMappings = ->
  mappings = {}

  for fieldName, spec of IPTC.schema()
    mappings[fieldName] = spec.pattern
  return mappings

IPTC.setSchema = (schema={}) ->
  IPTC._schema = schema

IPTC.doesFieldExists = (fieldName) ->
  return (IPTC._schema[fieldName]?)

IPTC.addField = (fieldName, iimField, pattern) ->
  unless IPTC.doesFieldExists(fieldName)
    IPTC._schema[fieldName] = {iimField: iimField, pattern: pattern}

IPTC.removeField = (fieldName) ->
  delete IPTC._schema[fieldName] if IPTC.doesFieldExists(fieldName)

IPTC.ERRORS =
  processorExist: 'Processor is already registered'
  processorNotFound: 'Processor is not registered'
