
And /^Load google search page$/ do
  google.load_page
end

And /^[Ss]et search textbox to (.*)$/ do |str|
  google.search_text(str)
end

And /^[Ee]xpect result page has (.*)$/ do |expecation|
  expect(google.validate_result).to eql(expecation)
end
# google.search(str)