

















Then /^expect Label form Domestic Address field displays (.*)$/ do |value|
  20.times do
    stamps.mail.print_form.mail_to.blur_out
    stamps.mail.print_form.mail_to.blur_out
    sleep(0.5);
    stamps.mail.print_form.mail_to.blur_out
    stamps.mail.print_form.mail_to.blur_out
    break if (stamps.mail.print_form.mail_to.address.text_area.text).gsub(/ \n/,", ").gsub(/\n/,", ") == value
  end
  expect((stamps.mail.print_form.mail_to.address.text_area.text).gsub(/ \n/,", ").gsub(/\n/,", ")).to eql value
  logger.step 'Address Cleansed -- Expected Result Confirmed'
end

