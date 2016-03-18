describe 'Picture', ->
  beforeEach ->
    @imageVariantData =
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
    @imageVariant = new ImageVariant(@imageVariantData)

    @picture = new Picture({
      title: new I18nSentence([
        new Sentence(value: 'My title', language: new ISOLanguage('en'))
      ])
      description: new I18nSentence([
        new Sentence(value: 'My description', language: new ISOLanguage('en'))
      ])
      variants: [@imageVariant]
      exif: new Exif({"Make": "Canon"})
      iptc: new IPTC({"City": "New York"})
    })

  it 'extends Space.domain.ValueObject', ->
    expect(Picture).to.extend(Space.domain.ValueObject)

  it 'is serializable', ->
    copy = EJSON.parse(EJSON.stringify(@picture))
    expect(copy.equals(@picture)).to.be.true

  describe 'immutability', ->
    it 'freezes itself', ->
      expect(Object.isFrozen(@picture)).to.be.true

  describe 'construction', ->
    it 'throws error if required value for variants is not assigned', ->
      expect(->
        new Picture({})
      ).to.throw

    it 'ensures that the value for variants is Array', ->
      expect(->
        new Picture({variants: 1234})
      ).to.throw Error

    it 'throws error if optional value for title is not I18nSentence type', ->
      expect(->
        new Picture({variants: [], title: 1234})
      ).to.throw

    it 'throws error if optional value for description is not I18nSentence type', ->
      expect(->
        new Picture({variants: [], description: 1234})
      ).to.throw

    it 'throws error if optional value for exif is not Exif type', ->
      expect(->
        new Picture({variants: [], exif: 1234})
      ).to.throw

    it 'throws error if optional value for iptc is not IPTC type', ->
      expect(->
        new Picture({variants: [], iptc: 1234})
      ).to.throw

    it 'throws error if multiple master variants are provided', ->
      expect(=>
        new Picture({variants: [@imageVariant, @imageVariant]})
      ).to.throw Picture.ERRORS.multipleMasterFiles


