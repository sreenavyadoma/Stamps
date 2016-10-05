Then /^Big Commerce: Expect Login to your Bigcommerce admin link is present$/ do
  logger.step "Big Commerce: Expect Login to your Bigcommerce admin link is present"
  expectation = "External Bigcommerce link is present"
  expectation = "External Bigcommerce link is not present" unless @store.external_link.present?
  expectation.should eql "External Bigcommerce link is present"
end