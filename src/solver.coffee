poemsFile = require('fs').readFileSync './poems.json', 'utf8'
poems = JSON.parse poemsFile

splitPoems = poems.map (poem) ->
  lines = poem.text?.split('\n').map (line) ->
    line.match /([А-Яа-я]+)/g
  lines?.pop()
  return lines

level1 = (line) ->
  re = new RegExp line
  poem = poems.find (p) -> re.test p.text
  poem.title

level2 = (line) ->
  re = new RegExp line.replace('%WORD%', '([А-Яа-я]+)')
  poem = poems.find (p) -> re.test p.text
  re.exec(poem.text)[1]


level3 = (lines) ->
  re = new RegExp lines.replace(/%WORD%/g, '([А-Яа-я]+)').replace(/\n/g, '\\n\\s*')
  poem = poems.find (p) -> re.test p.text
  matches = re.exec poem.text
  "#{matches[1]},#{matches[2]}"


level4 = (lines) ->
  re = new RegExp lines.replace(/%WORD%/g, '([А-Яа-я]+)').replace(/\n/g, '\\n\\s*')
  poem = poems.find (p) -> re.test p.text
  matches = re.exec poem.text
  "#{matches[1]},#{matches[2]},#{matches[3]}"

# level5f = (line) ->
#   words = line.match(/[А-Яа-яЁё]+/g)
#   re = new RegExp ('(?:' + words.map((word) -> line.replace word, '([А-Яа-яЁё]+)').join('|') + ')')
#   poem = poems.find (p) -> re.test p.text
#   for match, index in (poem.text.match re).splice(1)
#     return "#{match},#{words[index]}" if match?

level5 = (str) ->
  words = str.match /([А-Яа-я]+)/g
  for poem in splitPoems
    if poem
      for line in poem
        matches = 0
        mismatchIndex = -1
        if line?.length is words.length
          for word, index in line
            if word is words[index]
              matches++
            else mismatchIndex = index
          if matches is words.length - 1
            return "#{line[mismatchIndex]},#{words[mismatchIndex]}"


module.exports = solve = (level, string) ->
  switch level
    when '1' then level1 string
    when '2' then level2 string
    when '3' then level3 string
    when '4' then level4 string
    when '5' then level5 string
    else ''
