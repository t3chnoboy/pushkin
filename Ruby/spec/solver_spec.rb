require './solver'

describe "level_1" do
  it "should find the poem title by one line" do
    expect(level_1 "Отчизны внемлем призыванье.").to eq "К Чаадаеву"
    expect(level_1 "И на пирах разгульной дружбы,").to eq "19 октября 1827"
    expect(level_1 "Открытый в наши времена.").to eq "К языкову"
    expect(level_1 "Так вянет младость!").to eq "Роза"
  end
end

describe "level_2" do
  it "should find the missing word in one line" do
    expect(level_2 "Бог %WORD% вам, друзья мои,").to eq "помочь"
    expect(level_2 "Он видит — в %WORD% и звездах,").to eq "лентах"
    expect(level_2 "«Прости, — он %WORD%, — тебя я видел,").to eq "рек"
    expect(level_2 "Пушкин %WORD% ускользнул,").to eq "бесом"
  end
end

describe "level_1_hash" do
  it "should find the poem title by one line" do
    expect(level_1_hash "Отчизны внемлем призыванье.").to eq "К Чаадаеву"
    expect(level_1_hash "И на пирах разгульной дружбы,").to eq "19 октября 1827"
    expect(level_1_hash "Открытый в наши времена.").to eq "К языкову"
    expect(level_1_hash "Так вянет младость!").to eq "Роза"
  end
end

describe "level_2_hash" do
  it "should find the missing word in one line" do
    expect(level_2_hash "Бог %WORD% вам, друзья мои,").to eq "помочь"
    expect(level_2_hash "Он видит — в %WORD% и звездах,").to eq "лентах"
    expect(level_2_hash "«Прости, — он %WORD%, — тебя я видел,").to eq "рек"
    expect(level_2_hash "Пушкин %WORD% ускользнул,").to eq "бесом"
  end
end

describe "level_5" do
  it "should find replaced word in given line" do
    # expect(level_5_hash "К ногам невест повергли сабля и щит").to eq "меч,сабля"
    expect(level_5_hash "Вливали в сердце хладный яд.").to eq "душу,сердце"
    expect(level_5_hash "Чтоб в битвах гром из ног метал").to eq "рук,ног"
  end
end

describe "level_5_hash" do
  it "should find replaced word in given line" do
    # expect(level_5_hash "К ногам невест повергли сабля и щит").to eq "меч,сабля"
    expect(level_5_hash "Вливали в сердце хладный яд.").to eq "душу,сердце"
    expect(level_5_hash "Чтоб в битвах гром из ног метал").to eq "рук,ног"
  end
end
