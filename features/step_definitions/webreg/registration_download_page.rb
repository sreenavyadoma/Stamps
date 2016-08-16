Then /^Registration: Expect Web Registration result page is either Download page or Webpostage$/ do
  case @webreg_result_page
    when WebReg::DownloadPage
      expectation = "Congratulations on your new account!"
      actual_value = webreg.profile.membership.download_page.text
      logger.info "Test #{(actual_value==expectation)?"Passed":"Failed"}"
      actual_value.should eql expectation
    when MailLandingPage
      @webreg_result_page.url.should include "stamps.com/Webpostage"
    else
      raise "Registration Result #{@webreg_result_page.class} is not recognized"
  end
end