solve = require '../lib/solver'

describe 'tasks', ->

  describe 'level 1', ->
    it 'should find the poem title by one line', ->

      line = 'Отчизны внемлем призыванье.'
      title = solve '1', line
      title.should.equal 'К Чаадаеву'

      line = 'И на пирах разгульной дружбы,'
      title = solve '1', line
      title.should.equal '19 октября 1827'

      line = 'Открытый в наши времена.'
      title = solve '1', line
      title.should.equal 'К языкову'

      line = 'Так вянет младость!'
      title = solve '1', line
      title.should.equal 'Роза'

      line = 'Ямщик лихой, седое время'
      title = solve '1', line
      console.log title

      line = 'И впредь у нас не разрывайте'
      title = solve '1', line
      console.log title

      line = 'Иль ходит месяц средь небес'
      title = solve '1', line
      console.log title

  describe 'level 2', ->
    it 'should find the missing word in one line', ->

      line = 'Бог %WORD% вам, друзья мои,'
      word = solve '2', line
      word.should.equal 'помочь'

      line = 'Он видит — в %WORD% и звездах,'
      word = solve '2', line
      word.should.equal 'лентах'

      line = '«Прости, — он %WORD%, — тебя я видел,'
      word = solve '2', line
      word.should.equal 'рек'

      line = 'Пушкин %WORD% ускользнул,'
      word = solve '2', line
      word.should.equal 'бесом'

  describe 'level 3', ->
    it 'should find the missing words in two lines', ->

      lines = 'На %WORD% склонясь, наш кормщик умный\nВ молчанье правил грузный %WORD%;'
      words = solve '3', lines
      words.should.equal 'руль,челн'

      lines = 'Воды %WORD%\nПлавно %WORD%.'
      words = solve '3', lines
      words.should.equal 'глубокие,текут'

      lines = 'Что ты, %WORD%, грустна,\nМолча %WORD%,'
      words = solve '3', lines
      words.should.equal 'девица,присмирела'


  describe 'level 4', ->
    it 'should find the missing words in two lines', ->

      lines = 'Но %WORD% отравой:\nОн заманит %WORD% потом\nТебе во %WORD% опять за славой.'
      words = solve '4', lines
      words.should.equal 'упоительной,меня,след'

      lines = 'Ты увлечен был в %WORD% кровавый,\nЧтоб в %WORD% и венцах сиял,\nЧтоб в битвах гром из рук %WORD%'
      words = solve '4', lines
      words.should.equal 'путь,лаврах,метал'

      lines = 'Делибаш на %WORD% скаку\nСрежет %WORD% кривою\nС плеч удалую %WORD%.'
      words = solve '4', lines
      words.should.equal 'всем,саблею,башку'

  describe 'level 5', ->
    it 'should find replaced word in given line', ->

      line = 'К ногам невест повергли сабля и щит'
      words = solve '5', line
      words.should.equal 'меч,сабля'

      line = 'Вливали в сердце хладный яд.'
      words = solve '5', line
      words.should.equal 'душу,сердце'

      line = 'Чтоб в битвах гром из ног метал'
      words = solve '5', line
      words.should.equal 'рук,ног'

  describe.skip 'when input is fucked up', ->
    it 'should not crap out', ->
      solve '', ''
      solve '23', ''
      solve '', 'sdgsadg'
      solve 'w00t', ''
      solve 0, 'asdg'
      solve '1', '%WORD%'
      solve '3', '%WORD%Б%WORD%ы%WORD%л%WORD%а%WORD% %WORD%м%WORD%н%WORD%е%WORD% %WORD%р%WORD%о%WORD%к%WORD%о%WORD%м%WORD% %WORD%с%WORD%у%WORD%ж%WORD%д%WORD%е%WORD%н%WORD%а%WORD% %WORD%—%WORD%\nСамолюбивых дум %WORD%!'
