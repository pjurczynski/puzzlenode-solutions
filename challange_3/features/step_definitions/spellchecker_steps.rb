def output
  @output ||= StringIO.new
end

def speller
  @speller ||= SpellChecker::Speller.new(output)
end

Given /^I Have not yet started the SpellCheck program$/ do
end

When /^I start it$/ do
  speller.run(['nom', 'numb'])
end

Then /^the program should say "([^"]*)"$/ do |message|
  output.string.split("\n").should include(message)
end

Given /^the suggestions "([^"]*)" and "([^"]*)"$/ do |suggestion_one, suggestion_two|
  speller.run([suggestion_one, suggestion_two])
end

When /^I enter a word "([^"]*)"$/ do |word|
  speller.check(word)
end

Then /^the corrected word shuold be "([^"]*)"$/ do |correct_word|
  output.string.split("\n").should include(correct_word)
end
