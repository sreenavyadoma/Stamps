
Then /^[Ss]elect Print On (.*)$/ do |str|
  if SdcEnv.new_framework
    SdcMail.print_on.select(str)
  else
    stamps.mail.print_on(str)
  end
  TestData.hash[:print_on] = str
end