describe 'ImageVariant', ->
  beforeEach ->
    @imageVariant = new ImageVariant({
      type: 'small'
      width: 400
      height: 7000
      url: new URI('https://avatars0.githubusercontent.com/u/13420421?v=3&s=200')
      fileInfo: new FileInfo({
        name: "my-file.png"
        extension: 'png'
        size: 100
        type: new MIMEType('image/png')
        createdAt: new Date()
      })
      isAnimated: false
      isMaster: true
    })

  it 'extends Space.domain.ValueObject', ->
    expect(ImageVariant).to.extend(Space.domain.ValueObject)

  it 'is serializable', ->
    copy = EJSON.parse(EJSON.stringify(@imageVariant))
    expect(copy.equals(@imageVariant)).to.be.true

  describe 'immutability', ->
    it 'freezes itself', ->
      expect(Object.isFrozen(@imageVariant)).to.be.true

  describe 'construction', ->
    it 'throws error if required value for type is not assigned', ->
      expect(->
        new ImageVariant({})
      ).to.throw Error

    it 'ensures that the value for type is String', ->
      expect(->
        new ImageVariant({type: 1234})
      ).to.throw Error

    it 'throws error if required value for url is not assigned', ->
      expect(->
        new ImageVariant({type: 'thumbnail'})
      ).to.throw Error


    it 'ensures that the value for isMaster is Boolean', ->
      expect(->
        new ImageVariant({
          type: 'thumbnail', url: new URI('http://localhost'), isMaster: 1234
        })
      ).to.throw Error

    it 'throws error if optional value for width is not Number type', ->
      expect(->
        new ImageVariant({
          type: 'thumbnail', url: new URI('http://localhost'), width: 'abcd'
        })
      ).to.throw Error

    it 'throws error if optional value for height is not Number type', ->
      expect(->
        new ImageVariant({
          type: 'thumbnail', url: new URI('http://localhost'), height: 'abcd'
        })
      ).to.throw Error

    it 'throws error if optional value for fileInfo is not FileInfo type', ->
      expect(->
        new ImageVariant({
          type: 'thumbnail', url: new URI('http://localhost'), fileInfo: {}
        })
      ).to.throw Error

    it 'throws error if optional value for isAnimated is not Boolean type', ->
      expect(->
        new ImageVariant({
          type: 'thumbnail',
          url: new URI('http://localhost'),
          isAnimated: 'yah yah'
        })
      ).to.throw Error

    it 'throws error if optional value for isMaster is not Boolean type', ->
      expect(->
        new ImageVariant({
          type: 'thumbnail',
          url: new URI('http://localhost'),
          isMaster: 'nope nope'
        })
      ).to.throw Error

  describe 'conversion', ->
   it "returns string from ImageVariant's type", ->
      expect(@imageVariant.toString()).to.equal 'small'


