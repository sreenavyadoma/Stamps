# encoding: utf-8

Then /^Mail: Set Print On to (.*)/ do |media|
  #logger.step "Mail: Set Print On to #{media}"
  test_data[:print_on] = media
  stamps.mail.print_on.select media
end

Then /^Mail: Select Stamps$/ do
  step "Mail: Set Print On to Stamps"
end

Then /^Mail: Select Shipping Label - 8 ½” x 11” Paper$/ do
  step "Mail: Set Print On to Shipping Label - 8 x 11 Paper"
end

Then /^Mail: Select Shipping Label - SDC-1200, 4 ¼” x 6 ¾”$/ do
  step "Mail: Set Print On to Shipping Label - SDC-1200"
end

Then /^Mail: Select Shipping Label - 5 ½” x 8 ½”$/ do
  step "Mail: Set Print On to Shipping Label - 5 x 8"
end

Then /^Mail: Select Envelope - #10, 4 ⅛” x 9 ½”$/ do
  step "Mail: Set Print On to Envelope 10"
end

Then /^Mail: Select Envelope - #9, 3 ⅞” x 8 ⅞”$/ do
  step "Mail: Set Print On to Envelope 9"
end

Then /^Mail: Select Envelope - #A9, 5 ¾” x 8 ¾”$/ do
  step "Mail: Set Print On to Envelope A9"
end

Then /^Mail: Select Envelope - #6, 3 ⅝” x 6 ½”$/ do
  step "Mail: Set Print On to Envelope 6"
end

Then /^Mail: Select Envelope - #A2, 4 ⅜” x 5 ¾”$/ do
  step "Mail: Set Print On to Envelope A2"
end

Then /^Mail: Select Envelope - #7, 3 ⅞” x 7 ½”$/ do
  step "Mail: Set Print On to Envelope 7"
end

Then /^Mail: Select Envelope - #11, 4 ½” x 10 ⅜”$/ do
  step "Mail: Set Print On to Envelope 11"
end

Then /^Mail: Select Envelope - #12, 4 ¾” x 11”$/ do
  step "Mail: Set Print On to Envelope 12"
end

Then /^Mail: Select Certified Mail Label - SDC-3610$/ do
  step "Mail: Set Print On to Certified Mail Label - SDC-3610"
end

Then /^Mail: Select Certified Mail Label - SDC-3710$/ do
  step "Mail: Set Print On to Certified Mail Label - SDC-3710"
end

Then /^Mail: Select Certified Mail Label - SDC-3910$/ do
  step "Mail: Set Print On to Certified Mail Label - SDC-3910"
end

Then /^Mail: Select Certified Mail Label - SDC-3810$/ do
  step "Mail: Set Print On to Certified Mail Label - SDC-3810"
end

Then /^Mail: Select Roll - 4” x 6” Shipping Label$/ do
  step "Mail: Set Print On to Roll - 4 x 6"
end

Then /^Mail: Select Roll - 4 ⅛” x 6 ¼” Shipping Label$/ do
  step "Mail: Set Print On to Roll - 4 1/8 x 6 1/4"
end
