require 'JSON'

f = File.open( "poems.json", "r" )
$poems = JSON.load( f )
$poems_hash = Hash[$poems.map(&:values).map(&:flatten)]

def level_1 line
  re = Regexp.new line
  $poems.find {|e| re =~ e["text"]}["title"]
end

def level_2 line
  re = Regexp.new line.gsub('%WORD%', '([А-Яа-я]+)')
  poem = $poems.find {|e| re =~ e["text"]}
  re.match(poem["text"])[1]
end

def level_1_hash line
  re = Regexp.new line
  $poems_hash.find {|key, val| re =~ val}[0]
end

def level_2_hash line
  re = Regexp.new line.gsub('%WORD%', '([А-Яа-я]+)')
  poem = $poems_hash.find {|key, val| re =~ val}[1]
  re.match(poem)[1]
end

def level_5 line
  words = line.scan /[А-Яа-я]+/
  re = Regexp.new ('(?:' + words.map { |word| line.gsub(word, '([А-Яа-я]*)')}.join('|') + ')')
  matches = re.match ($poems.find {|e| re =~ e["text"]})["text"]
  index = matches.to_a.drop(1).index {|x| !x.nil?}
  "#{matches[index + 1]},#{words[index - 1]}"
end

def level_5_hash line
  words = line.scan /[А-Яа-я]+/
  re = Regexp.new ('(?:' + words.map { |word| line.gsub(word, '([А-Яа-я]+)')}.join('|') + ')')
  matches = re.match($poems_hash.find {|key, val| re =~ val}[1])
  index = matches.to_a.drop(1).index {|x| !x.nil?}
  "#{matches[index + 1]},#{words[index - 1]}"
end
