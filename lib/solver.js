var level1, level2, level3, level4, level5, poems, poemsFile, solve, splitPoems;

poemsFile = require('fs').readFileSync('./poems.json', 'utf8');

poems = JSON.parse(poemsFile);

splitPoems = poems.map(function(poem) {
  var lines, _ref;
  lines = (_ref = poem.text) != null ? _ref.split('\n') : void 0;
  lines = lines != null ? lines.map(function(line) {
    return line.match(/([А-Яа-я]+)/g);
  }) : void 0;
  if (lines != null) {
    lines.pop();
  }
  return lines;
});

level1 = function(line) {
  var poem, re;
  re = new RegExp(line);
  poem = poems.find(function(p) {
    return re.test(p.text);
  });
  return poem.title;
};

level2 = function(line) {
  var poem, re;
  re = new RegExp(line.replace('%WORD%', '([А-Яа-я]+)'));
  poem = poems.find(function(p) {
    return re.test(p.text);
  });
  return re.exec(poem.text)[1];
};

level3 = function(lines) {
  var matches, poem, re;
  re = new RegExp(lines.replace(/%WORD%/g, '([А-Яа-я]+)').replace(/\n/g, '\\n\\s*'));
  poem = poems.find(function(p) {
    return re.test(p.text);
  });
  matches = re.exec(poem.text);
  return "" + matches[1] + "," + matches[2];
};

level4 = function(lines) {
  var matches, poem, re;
  re = new RegExp(lines.replace(/%WORD%/g, '([А-Яа-я]+)').replace(/\n/g, '\\n\\s*'));
  poem = poems.find(function(p) {
    return re.test(p.text);
  });
  matches = re.exec(poem.text);
  return "" + matches[1] + "," + matches[2] + "," + matches[3];
};

level5 = function(str) {
  var i, index, line, mismatchIndex, poem, word, words, _i, _j, _k, _len, _len1, _len2;
  words = str.match(/([А-Яа-я]+)/g);
  for (_i = 0, _len = splitPoems.length; _i < _len; _i++) {
    poem = splitPoems[_i];
    if (poem) {
      for (_j = 0, _len1 = poem.length; _j < _len1; _j++) {
        line = poem[_j];
        i = 0;
        mismatchIndex = 0;
        if ((line != null ? line.length : void 0) === words.length) {
          for (index = _k = 0, _len2 = line.length; _k < _len2; index = ++_k) {
            word = line[index];
            if (word === words[index]) {
              i++;
            } else {
              mismatchIndex = index;
            }
          }
          if (i === words.length - 1) {
            return "" + line[mismatchIndex] + "," + words[mismatchIndex];
          }
        }
      }
    }
  }
  return 'nigg';
};

solve = function(level, string) {
  switch (level) {
    case '1':
      return level1(string);
    case '2':
      return level2(string);
    case '3':
      return level3(string);
    case '4':
      return level4(string);
    case '5':
      return level5(string);
    default:
      return '';
  }
};

module.exports = solve;
