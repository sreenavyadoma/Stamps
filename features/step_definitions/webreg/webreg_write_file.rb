
Then /^Orders: Sign in using Jenkins web reg credentials$/ do
  logger.step "Orders: Sign in"
  ENV['USR'].should be_truthy
  ENV['PW'].should be_truthy
  web_apps.orders.landing_page.sign_in ENV['USR'], ENV['PW']
end

Then /^PAM Customer Search: Set username as web reg credentials$/ do
  logger.info "PAM Customer Search: Set username as web reg credentials"
  ENV['USR'].should be_truthy
  step "PAM Customer Search: Set username to #{ENV['USR']}"
end

Then /^WebReg Profile: Write credentials to properties file$/ do
  step "WebReg Profile: Write username to properties file"
  step "WebReg Profile: Write password to properties file"
end

Then /^WebReg Profile: Write username to properties file$/ do
  logger.message "WebReg Profile: Write username to properties file: #{webreg_usr_filename}"
  File.open(webreg_usr_filename, 'a+') {|f| f.write("USR=#{@username}\n")}
  step "WebReg Profile: Save username to file"
end

Then /^WebReg Profile: Write password to properties file$/ do
  logger.message "WebReg Profile: Write password to properties file: #{webreg_usr_filename}"
  File.open(webreg_usr_filename, 'a+') {|f| f.write("PW=#{@password}\n")}
end

Then /^WebReg Profile: Save username to file$/ do
  logger.message "WebReg Profile: Save username to file: #{webreg_data_filename}"
  File.open(webreg_data_filename, 'a+') {|f| f.write("#{@username}\n")}
end

Then /^PAM: Write username to properties file$/ do
  logger.message "WebReg Profile: Write username to properties file: #{reg_pam_data_filename}"
  File.open(reg_pam_data_filename, 'a+') {|f| f.write("#{@username}\n")}
end

Then /^WebReg PAM Orders: Write username to properties file$/ do
  logger.message "WebReg Profile: Write username to properties file: #{reg_pam_ord_data_filename}"
  File.open(reg_pam_ord_data_filename, 'a+') {|f| f.write("#{@username}\n")}
end