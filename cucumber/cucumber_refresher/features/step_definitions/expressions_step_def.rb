Given(/I provide an integer number of (.*)/) do |int|
  @int_number = int.to_i
end

Then("I will have {int} types of this veg in my belly:") do |int, table|
  vegetables = table.raw
  # p vegetables
  # p vegetables.to_h
  vegetables.each do |veg|
    expect(veg[0]).to be_kind_of String
  end
end

Given(/I provide an integer of (\d)/) do |int|
  @number = int
end

Then(/I will have (\d) cucumbers in my belly/) do |int|
  expect(@number).to eq int
end

Given(/I provide a float of (\d\.\d*)/) do |float|
  @float_number = float
end

Then(/I will have (\d\.\d*) aubergines in my belly/) do |float|
  expect(@float_number).to eq float
end

Given(/I provide a word of (\w*)/) do |word|
  @word = word
end

Then(/I will have (\w*) in my belly/) do |word|
  expect(@word).to eq word
end

Given(/I provide a float and string of (\d\.\d*) (['][a-z]*[^\d]*\s[a-z]*[^\d]['])/) do |float, string|
# Given("I provide a float and string of {float} {string}") do |float, string|
  @float = float
  @string = string
end

Then(/I will have (\d\.\d*) (['][a-z]*[^\d]*\s[a-z]*[^\d][']) in my belly/) do |float, string|
# Then("I will have {float} {string} in my belly") do |float, string|
  expect(@float).to eq float
  expect(@string).to eq string
end
