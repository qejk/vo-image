class MyProcessor extends IPTC.Processor
  process: (data) -> return data

describe 'IPTC', ->
  beforeAll ->
    @fields = {}
    @fields.string = [
      'Image Name', 'Edit Status', 'Priority', 'Category',
      'Supplemental Category', 'Fixture Identifier', 'Keyword', 'Release Date',
      'Release Time', 'Special Instructions', 'Reference Service',
      'Reference Date', 'Reference Number', 'Created Date', 'Created Time',
      'Originating Program', 'Program Version', 'Object Cycle', 'Byline',
      'Byline Title', 'City', 'Sub-Location', 'Province State', 'Country Code',
      'Country', 'Original Transmission Reference', 'Headline', 'Credit',
      'Source', 'Copyright String', 'Caption', 'Local Caption'
    ]

    @processors = IPTC.processors()
    @data =
      'Image Name': 'Man Planting Onions'
      'Edit Status': 'archived'
      'Priority': '8'
      'Category': 'EDU'
      'Supplemental Category': 'Selection 2007 Presentation'
      'Fixture Identifier': 'Webcam'
      'Keyword': 'agriculture, farm laborer, farmer, field hand, field worker, humans, occupation, people, agricultural, agronomy, crops, onions, vegetable crops, plants, vegetables, outdoors, outside, agricultural equipment, tractor, gender, male, men.'
      'Release Date': "20060726"
      'Release Time': "152011-0300"
      'Special Instructions': "Image to be used one time only, non-exclusive in
      English-language-edition magazine as inside image, no larger than a full
      page in color. Additional third-party rights to be negotiated with Julie Doe
      / XYZ Agency in advance. All rights not specifically granted are reserved.
      See delivery memo for specific license."
      'Reference Service': ""
      'Reference Date': "20060726"
      'Reference Number': ""
      'Created Date': "20060726"
      'Created Time': "152011-0300"
      'Originating Program': "GIMP"
      'Program Version': "2.0"
      'Object Cycle': "b"
      'Byline': "Peter Parker"
      'Byline Title': "Freelance photographer hated by J.Jonah Jameson "
      'City': "New York"
      'Sub-Location': "Forrest Hills"
      'Province State': "Queens"
      'Country Code': "USA"
      'Country': "United States of America"
      'Original Transmission Reference': ""
      'Headline': "Farmer planting onions"
      'Credit': "Daily Bugle, Ltd."
      'Source': "Betty Brant, Daily Bugle, Ltd."
      'Copyright String': "© Peter Parker, 2016 All Rights Reserved"
      'Caption': "TheShore Temple of the Seven Pagodas was built underNarsimha II
      of the Pallava dynasty between 7th and 8th century AD and is dedicated to
      Lord Shiva. It resembles the structure of the Dharmaraja rath, but its tower
      rises much higher (approx. five stories or ~ 60 ft. high) and its stupa
      spire is small and slender."
      'Local Caption': ""
      'Caption Writer': ""

  beforeEach ->
    IPTC.setSchema(_.extend({}, IPTC.DEFAULT_SCHEMA))
    IPTC.setProcessors(_.extend({}, @processors))
    @iptc = new IPTC(@data)

  it 'extends Space.domain.ValueObject', ->
    expect(IPTC).to.extend(Space.domain.ValueObject)

  it 'is serializable', ->
    copy = EJSON.parse(EJSON.stringify(@iptc))
    expect(copy.equals(@iptc)).to.be.true

  describe 'immutability', ->
    it 'freezes itself', ->
      expect(Object.isFrozen(@iptc)).to.be.true

  describe 'schema', ->
    it 'returns fields that correspond to added IPTC schema mappings', ->
      expect(IPTC::fields()).to.eql IPTC.schemaMappings()

  describe 'construction', ->
    it 'it takes IPTC data', ->
      expect(new IPTC(@data).toPlainObject()).to.eql @data

    it 'ensures that string IPTC schema values are String', ->
      for field in @fields.string
        data = {}
        data[field] = 1234
        expect(-> new IPTC(data)).to.throw Error

  describe 'schema', ->
    it 'ensures that all default required IPTC schema fields are mapped', ->
      expect(IPTC.DEFAULT_SCHEMA).to.contain.all.keys(_.keys(@data))

    it 'sets IPTC schema', ->
      schema = {'Image Name': {iimField: 5, pattern: String}}

      IPTC.setSchema(schema)
      expect(IPTC.schema()).to.equal schema
      expect(IPTC::fields()).to.eql {'Image Name': String}

    it 'adds IPTC schema field', ->
      IPTC.setSchema({})
      fieldName = 'MyTag'

      IPTC.addField(fieldName, 69, String)
      expect(
        IPTC.schema()[fieldName]? and IPTC.schema()[fieldName].pattern == String
      ).to.equal true
      expect(IPTC.doesFieldExists(fieldName)).to.equal true
      expect(IPTC.fieldNames().length).to.equal 1

    it 'removes IPTC schema field', ->
      IPTC.setSchema({})
      fieldName = 'MyTag'

      IPTC.addField(fieldName, 69, String)
      expect(IPTC.removeField(fieldName))
      expect(IPTC.doesFieldExists(fieldName)).to.equal false
      expect(IPTC.fieldNames().length).to.equal 0

  describe 'processing', ->
    it 'maps field names to schema fields by IIM number from imagemagick
    output', ->
      unprocessedData =
        "Byline[2,80]": "Peter Parker",
        "City[2,90]": "New York",
        "Country[2,101]": "United States",
        "Created Date[2,55]": "20140201",
        "Copyright String[2,116]": "Peter Parker",
        "Keyword[2,25]": "spiders",
        "Province State[2,95]": "Queens",
        "Created Time[2,60]": "154507",
        "unknown[2,92]": "Forest Hills"
      processedData =
        "Byline": "Peter Parker",
        "City": "New York",
        "Country": "United States",
        "Created Date": "20140201",
        "Copyright String": "Peter Parker",
        "Keyword": "spiders",
        "Province State": "Queens",
        "Created Time": "154507",
        "Sub-Location": "Forest Hills"

      expect(
        IPTC.process(unprocessedData).toPlainObject()
      ).to.eql processedData


    it 'registers a processor', ->
      IPTC.setProcessors({})

      mapping = 'MyProcessor'
      myProcessor = new MyProcessor

      IPTC.registerProcessor(mapping, myProcessor)

      expect(IPTC.doesProcessorExists(mapping)).to.equal true
      expect(
        _.keys(IPTC.processors()).length
      ).to.equal 1

    it 'removes a processor', ->
      IPTC.setProcessors({})

      mapping = 'MyProcessor'
      myProcessor = new MyProcessor

      IPTC.registerProcessor(mapping, myProcessor)
      IPTC.removeProcessor(mapping)

      expect(IPTC.doesProcessorExists(mapping)).to.equal false
      expect(
        _.keys(IPTC.processors()).length
      ).to.equal 0

    it 'throws error if tries register processor with same mapping twice', ->
      mapping = 'MyProcessor'
      myProcessor = new MyProcessor

      IPTC.registerProcessor(mapping, myProcessor)
      expect(->
        IPTC.registerProcessor(mapping, myProcessor)
      ).to.throw IPTC.ERRORS.processorExist

    it 'throws error if tries remove processor that is not registered', ->
      expect(=>
        IPTC.removeProcessor('MyProcessor')
      ).to.throw IPTC.ERRORS.processorNotFound
