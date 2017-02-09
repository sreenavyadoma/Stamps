# encoding: utf-8

Then /^on Print form, set Print On to (.*)/ do |media|
  test_data[:print_on] = media
  stamps.mail.print_on.select(test_data[:print_on])
end

Then /^on Print form, select Stamps$/ do
  step "on Print form, set Print On to Stamps"
end

Then /^on Print form, select Certified Mail Label - SDC-3610$/ do
  step "on Print form, set Print On to Certified Mail Label - SDC-3610"
end

Then /^on Print form, select Certified Mail Label - SDC-3710$/ do
  step "on Print form, set Print On to Certified Mail Label - SDC-3710"
end

Then /^on Print form, select Certified Mail Label - SDC-3910$/ do
  step "on Print form, set Print On to Certified Mail Label - SDC-3910"
end

Then /^on Print form, select Certified Mail Label - SDC-3810$/ do
  step "on Print form, set Print On to Certified Mail Label - SDC-3810"
end

Then /^on Print form, select Roll - 4” x 6” Shipping Label$/ do
  step "on Print form, set Print On to Roll - 4 x 6"
end

Then /^on Print form, select Roll - 4 ⅛” x 6 ¼” Shipping Label$/ do
  step "on Print form, set Print On to Roll - 4 1/8 x 6 1/4"
end
