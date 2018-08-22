Then /^WL: blur_out on create account page$/ do
  SWWR.create_your_account.create_account_breadcrumb.blur_out
end

Then /^WL: expect creat account header is$/ do |str|
  SWWR.create_your_account.create_account_breadcrumb.blur_out
end
