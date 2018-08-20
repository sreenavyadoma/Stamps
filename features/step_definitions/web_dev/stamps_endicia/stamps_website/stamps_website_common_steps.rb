Then /^SDCW: Navigate to home page$/ do

  StampsWebsite::SDCWWebsite.visit
  common_page.stamps_logo.wait_until_present(timeout: 10)

  common_page.get_started.click!
  SdcLogger.info "Sourceid = #{source_id}"
  SdcLogger.info "Offerid = #{offer_id}"

  TestData.hash[:source_id] = source_id
  TestData.hash[:content] = content
  TestData.hash[:promo_code] = promo_code
  TestData.hash[:offer_id] = offer_id
  TestData.hash[:target_url] = target_url
  TestData.hash[:security_questions_before_registration] = security_questions_before_reg
end