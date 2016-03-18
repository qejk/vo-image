Picture = Space.domain.ValueObject.extend 'Picture',

  fields: ->
    title: Match.Optional(I18nSentence)
    description: Match.Optional(I18nSentence)
    variants: [ImageVariant]
    exif: Match.Optional(Exif)
    iptc: Match.Optional(IPTC)

  Constructor: (data) ->
    Space.domain.ValueObject.call(@, data)
    Picture.validate(data)
    Object.freeze(@)

Picture.validate = (data) ->
  unless Picture.areValidVariants(data.variants)
    throw new Error(Picture.ERRORS.multipleMasterFiles)

Picture.areValidVariants = (variants) ->
  masters = 0
  for variant in variants
    masters = masters + 1 if variant.isMaster == true

  return (masters <= 1)

Picture.ERRORS =
  multipleMasterFiles: 'Picture can have only one master variant provided'