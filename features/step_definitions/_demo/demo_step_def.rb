
Then /^set google search textbox to (.*)$/ do |str|
  Google.visit
  if SdcEnv.browser
    Google.new.search.set(str)
    sleep 2
    Google.new.search.send_keys :enter
    sleep 2
  elsif SdcEnv.mobile
    IGoogle.new.search.set(str)
    sleep 2
    IGoogle.new.search.send_keys :enter
    IGoogle.new.search.send_keys :enter
    IGoogle.new.search.safe_click
    IGoogle.new.search.click
    IGoogle.new.search.click
    sleep 2
  end
end
