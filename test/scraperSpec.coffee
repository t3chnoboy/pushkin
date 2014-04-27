scraper = require '../lib/scraper'

describe 'scraper', ->

  describe 'getPoemIds()', ->
    it 'should return an array of poem ids', -->

      poemList = yield scraper.getPoemIds()
      poemList.should.be.an.Array.and.have.lengthOf 1309

      describe 'poemId', ->
        poemId = poemList[0]

        it 'should be a string containing first poem\'s id', ->
          poemId.should.be.a.String.and.equal '629'

  describe 'getPoem(id)', ->
    it 'should return a poem with specified id', -->
      poem = yield scraper.getPoem '629'

      describe 'poem', ->
        it 'should have a title', ->
          poem.should.have.property 'title'
          poem.title.should.equal '19 октября 1827'

        it 'should have a text', ->
          poem.should.have.property 'text'
          poem.text.should.match /И в бурях, и в житейском горе/

  describe 'getPoems()', ->
    it 'should return an array of poems', -->
      poems = yield scraper.getPoems()
      poems.should.be.an.Array.and.have.lengthOf 1309

      describe 'poem', ->
        poem = poems[0]
        it 'should have a tilte and text', ->
          poem.should.have.property 'title'
          poem.should.have.property 'text'
