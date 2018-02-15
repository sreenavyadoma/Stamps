Then /^Registration: Expect Web Registration result page is either Download page or Webpostage$/ do
  case @web_mail
    when Registration::DownloadPage
      expect(registration.membership.download_page.text).to eql "Congratulations on your new account!"
    when WebMail
      expect(@web_mail.landing_page.whats_new_modal.window_title.text).to eql "What’s new in Stamps.com Online"
    else
      raise "Registration Result #{@web_mail.class} is not recognized"
  end
end

