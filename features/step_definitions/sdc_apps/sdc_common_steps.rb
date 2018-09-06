

Then /^click through windows tutorial$/ do
  tutorial = SdcWebsite.modals.windows_tutorial
  while tutorial.window.present?
    tutorial.title.safe_wait_until_present(timeout: 1)
    if tutorial.title.text.eql? 'Agree to Terms'
      tutorial.close.click
      break
    end
    tutorial.next.safe_click if tutorial.next.present?
    tutorial.window.safe_wait_until_present(timeout: 1)
  end
end