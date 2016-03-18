ImageVariant = Space.domain.ValueObject.extend 'ImageVariant',

  fields: ->
    type: String
    width: Match.Optional(Number)
    height: Match.Optional(Number)
    url: URI
    fileInfo: Match.Optional(FileInfo)
    isAnimated: Match.Optional(Boolean)
    isMaster: Match.Optional(Boolean)

  Constructor: (data) ->
    Space.domain.ValueObject.call(@, data)
    Object.freeze(@)

  toString: ->
    return @type

