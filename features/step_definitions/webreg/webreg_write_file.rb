
Then /^Orders: Sign in using Jenkins web reg credentials$/ do
  logger.step "Orders: Sign in"
  CONFIG = YAML.load_file(webreg_usr_filename)
  CONFIG['usr'].should be_truthy
  CONFIG['pw'].should be_truthy
  web_apps.orders.landing_page.sign_in CONFIG['usr'], CONFIG['pw']
end

Then /^PAM Customer Search: Set username as web reg credentials$/ do
  logger.info "PAM Customer Search: Set username as web reg credentials"
  CONFIG = YAML.load_file(webreg_usr_filename)
  CONFIG['usr'].should be_truthy
  step "PAM Customer Search: Set username to #{CONFIG['usr']}"
end

Then /^WebReg Profile: Write credentials to properties file$/ do
  step "WebReg Profile: Write username to properties file"
  step "WebReg Profile: Write password to properties file"
end

Then /^WebReg Profile: Write username to properties file$/ do
  logger.message "WebReg Profile: Write username to properties file: #{webreg_usr_filename}"
  File.open(webreg_usr_filename, 'w+') {|f| f.write("usr: #{@username}\n")}
  step "WebReg Profile: Save username to file"
end

Then /^WebReg Profile: Write password to properties file$/ do
  logger.message "WebReg Profile: Write password to properties file: #{webreg_usr_filename}"
  File.open(webreg_usr_filename, 'a+') {|f| f.write("pw: #{@password}\n")}
end

Then /^WebReg Profile: Save username to file$/ do
  logger.message "WebReg Profile: Save username to file: #{webreg_data_filename}"
  File.open(webreg_data_filename, 'a+') {|f| f.write("#{@username}\n")} unless File.readlines(webreg_data_filename).to_s.include? @username
end

Then /^PAM: Write username to properties file$/ do
  logger.message "WebReg Profile: Write username to properties file: #{reg_pam_data_filename}"
  File.open(reg_pam_data_filename, 'a+') {|f| f.write("#{@username}\n")} unless File.readlines(reg_pam_data_filename).to_s.include? @username
end

Then /^WebReg PAM Orders: Write username to properties file$/ do
  logger.message "WebReg Profile: Write username to properties file: #{reg_pam_ord_data_filename}"
  File.open(reg_pam_ord_data_filename, 'a+') {|f| f.write("#{@username}\n")} unless File.readlines(reg_pam_ord_data_filename).to_s.include? @username
end


