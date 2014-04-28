var cheerio, getPoem, getPoemIds, getPoems, iconv, parsePoem, parsePoems, poemsURL, request, toUtf8;

request = require('co-request');

cheerio = require('cheerio');

iconv = require('iconv-lite');

poemsURL = 'http://ilibrary.ru/author/pushkin/l.all/index.html';

exports.getPoemIds = getPoemIds = function*() {
  var poemsPage;
  poemsPage = yield request({
    url: poemsURL
  });
  return parsePoems(poemsPage.body);
};

exports.getPoem = getPoem = function*(id) {
  var poemPage;
  try {
    poemPage = yield request({
      url: "http://ilibrary.ru/text/" + id + "/p.1/index.html",
      encoding: null
    });
  } catch (_error) {}
  return parsePoem(poemPage.body);
};

exports.getPoems = getPoems = function*() {
  var ids;
  ids = yield getPoemIds;
  return yield ids.map(function(id) {
    return getPoem(id);
  });
};

parsePoems = function(poemsPage) {
  var $, ids;
  $ = cheerio.load(poemsPage);
  ids = $('.list:nth-child(2) a').map(function(elem) {
    var id, link;
    link = $(this).attr('href');
    return id = link.match(/\/text\/(\d+)\//)[1];
  });
  return ids.get().filter(function(id) {
    return id.length === 3;
  });
};

parsePoem = function(poemPage) {
  var $, poem;
  $ = cheerio.load(toUtf8(poemPage));
  return poem = {
    title: $('div.title h1').text(),
    text: $('div.par').text()
  };
};

toUtf8 = function(string) {
  return iconv.decode(string, 'win1251');
};
