Then /^Registration: Expect registration result page is either Download page or Webpostage$/ do
  case @registration_result_page
    when WebReg::DownloadPage
      expectation = "Congratulations on your new account!"
      actual_value = registration.profile.membership.download_page.text
      logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
      actual_value.should eql expectation
    when MailLandingPage
      @registration_result_page.url.should include "stamps.com/Webpostage"
    else
      raise "Registration Result #{@registration_result_page.class} is not recognized"
  end
end