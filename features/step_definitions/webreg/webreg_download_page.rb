Then /^Registration: Expect Web Registration result page is either Download page or Webpostage$/ do
  case @web_mail
    when WebReg::DownloadPage
      expectation = "Congratulations on your new account!"
      actual_value = webreg.profile.membership.download_page.text
      logger.step "Test #{(actual_value==expectation)?"Passed":"Failed"}"
      actual_value.should eql expectation
    when WebMail
      @web_mail.landing_page.whats_new_modal.window_title.text.should eql "What’s new in Stamps.com Online"
    else
      raise "Registration Result #{@web_mail.class} is not recognized"
  end
end

