IPTC.DEFAULT_SCHEMA =
  'Image Name':
    iimField: 5
    pattern: Match.Optional(String)
  'Edit Status':
    iimField: 7
    pattern: Match.Optional(String)
  'Priority':
    iimField: 10
    pattern: Match.Optional(String)
  # This field was deprecated (removed from use) when IPTC Core 1.0 was released
  # in 2005, http://www.controlledvocabulary.com/imagedatabases/iptc_naa.html (?)
  'Category':
    iimField: 15
    pattern: Match.Optional(String)
  'Supplemental Category':
    iimField: 20
    pattern: Match.Optional(String)
  'Fixture Identifier':
    iimField: 22
    pattern: Match.Optional(String)
  'Keyword':
    iimField: 25
    pattern: Match.Optional(String)
  'Release Date':
    iimField: 30
    pattern: Match.Optional(String)
  # "Release Time" relates to "Release Date". On IPTC extraction:
  # "Release Time": "152011-0300"
  # "Release Date": "20060726"
  # So both Release Date + Time actually are creating a typical JS Date object
  'Release Time':
    iimField: 35
    pattern: Match.Optional(String)
  'Special Instructions':
    iimField: 40
    pattern: Match.Optional(String)
  'Reference Service':
    iimField: 45
    pattern: Match.Optional(String)
  'Reference Date':
    iimField: 47
    pattern: Match.Optional(String)
  'Reference Number':
    iimField: 50
    pattern: Match.Optional(String)
  # "Created Time" relates to "Created Date". On IPTC extraction:
  # "Created Time": "152011-0300"
  # "Created Date": "20060726"
  # So both Created Date + Time actually are creating a typical JS Date object
  'Created Date':
    iimField: 55
    pattern: Match.Optional(String)
  'Created Time':
    iimField: 60
    pattern: Match.Optional(String)
  'Originating Program':
    iimField: 65
    pattern: Match.Optional(String)
  'Program Version':
    iimField: 70
    pattern: Match.Optional(String)
  # Processing cycle "and" - morning / afternoon, "p" - in the afternoon /
  # evening and "b" - both
  'Object Cycle':
    iimField: 75
    pattern: Match.Optional(String)
  'Byline':
    iimField: 80
    pattern: Match.Optional(String)
  'Byline Title':
    iimField: 85
    pattern: Match.Optional(String)
  'City':
    iimField: 90
    pattern: Match.Optional(String)
  'Sub-Location':
    iimField: 92
    pattern: Match.Optional(String)
  'Province State':
    iimField: 95
    pattern: Match.Optional(String)
  'Country Code':
    iimField: 100
    pattern: Match.Optional(String)
  'Country':
    iimField: 101
    pattern: Match.Optional(String)
  'Original Transmission Reference':
    iimField: 103
    pattern: Match.Optional(String)
  'Headline':
    iimField: 105
    pattern: Match.Optional(String)
  'Credit':
    iimField: 110
    pattern: Match.Optional(String)
  'Source':
    iimField: 115
    pattern: Match.Optional(String)
  'Copyright String':
    iimField: 116
    pattern: Match.Optional(String)
  'Caption':
    iimField: 120
    pattern: Match.Optional(String)
  'Local Caption':
    iimField: 121
    pattern: Match.Optional(String)
  "Caption Writer":
    iimField: 122
    pattern: Match.Optional(String)

IPTC.setSchema(IPTC.DEFAULT_SCHEMA)