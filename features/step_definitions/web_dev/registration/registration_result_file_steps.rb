Then /^load sign-in credentials(?:| from file (.*))$/ do |filename|
  data_file = registration_parameter_file(filename)

  expect(File.exist?(data_file)).to be_truthy
  yml_file = YAML.load_file(data_file)
  TestData.store[:username] = yml_file['username']
  TestData.store[:password] = yml_file['password']
  expect(TestData.store[:username]).to be_truthy
  expect(TestData.store[:password]).to be_truthy
end

Then /^[Ss]ave sign-in credentials(?:| to parameter file (.*))$/ do |str|
  if str.nil?
    step "save username to default parameter file"
    step "save password to default parameter file"
    step "store username to default data store file"
    step "send username to standard out"
  else
    step "save username to parameter file #{str}"
    step "save password to parameter file #{str}"
    step "store username to data store file #{str}"
    step "send username to standard out"
  end
end

Then /^[Ss]tore username to (?:default data store file|data store file (.*))$/ do |filename|
  data_file = registration_data_store_file(filename)
  expect(TestData.store[:username]).to be_truthy
  FileUtils.touch(data_file) unless File.file?(data_file)
  File.open(data_file, 'a+') {|f| f.write("#{TestData.store[:username]}\n")} unless File.readlines(data_file).to_s.include? TestData.store[:username]
end

Then /^[Ss]ave username to (?:default parameter file|parameter file (.*))$/ do |filename|
  data_file = registration_parameter_file(filename)
  sleep(0.25)
  File.open(data_file, 'w+') {|f| f.write("username: #{TestData.store[:username]}\n")}
end

Then /^[Ss]ave password to (?:default parameter file|parameter file (.*))$/ do |filename|
  data_file = registration_parameter_file(filename)
  sleep(0.25)
  File.open(data_file, 'a+') {|f| f.write("password: #{TestData.store[:password]}\n")}
end

Then /^[Oo]n PAM Customer Search page, set username from parameter file$/ do
  SdcLog.info "On PAM Customer Search page, set username from parameter file"
  step "On PAM Customer Search page, set username to #{SdcTest['username']}"
end

Then /^[Ss]et PAM Customer Search page username from parameter file$/ do
  step "set PAM Customer Search page username to #{SdcTest['username']}"
end

Then /^Orders: Sign-in using username and password from parameter file$/ do
  stamps.orders.landing_page.sign_in(TestData.store[:username], TestData.store[:password])
end

