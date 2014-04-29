request = require 'co-request'
cheerio = require 'cheerio'
iconv = require 'iconv-lite'

poemsURL = 'http://ilibrary.ru/author/pushkin/l.all/index.html'

exports.getPoemIds = getPoemIds = -->
  poemsPage = yield request url: poemsURL
  return parsePoems poemsPage.body

exports.getPoem = getPoem = (id) -->
  poemPage = yield request
    url: "http://ilibrary.ru/text/#{id}/p.1/index.html"
    encoding: null
  return parsePoem poemPage.body

exports.getPoems = getPoems = -->
  ids = yield getPoemIds
  return yield ids.map (id) -> getPoem id


parsePoems = (poemsPage) ->
  $ = cheerio.load poemsPage
  ids = $('.list:nth-child(2) a').map (elem) ->
    link = $(@).attr 'href'
    id = link.match(/\/text\/(\d+)\//)[1]
  return ids.get().filter (id) -> id.length is 3

parsePoem = (poemPage) ->
  $ = cheerio.load toUtf8 poemPage
  return poem =
    title: $('div.title h1').text()
    text: $('div.par').text()

toUtf8 = (string) -> iconv.decode(string, 'win1251')
