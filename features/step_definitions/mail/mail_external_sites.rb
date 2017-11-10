# Net stamps page step definitions

Then /^[Ee]xpect [Bb]uy [Mm]ore [Ll]abels link [Nn]et[Ss]tamps [Hh]ome button exists$/ do
  step "Pause for 2 seconds"
  expect(stamps.mail.mail_external_sites.net_stamps_home_btn.present?).to be(true), "Home Button doesn't present"
end