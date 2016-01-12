# encoding: utf-8

Then /^Select Stamps Calculate Postage Amount/ do
  @postage_form.calculate_postage_button.click
end

Then /^Set Stamps Weight (\d+) lbs (\d+) oz$/ do |lbs, oz|

end

Then /^Set Stamps Extra Services amount to $(.*)$/ do |amount|

end