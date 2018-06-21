Then /^expect service commitments modal is present$/ do
  expect(SdcMail.modals.service_commitments.title).to be_present, "Service Commitments modal is not present"
end

Then /^expect service commitments modal is not present$/ do
  expect(SdcMail.modals.service_commitments.title).not_to be_present, "Service Commitments modal is still present"
end

Then /^close advanced options service commitments modal$/ do
  expect(SdcMail.modals.service_commitments.title).not_to be_present, "Service Commitments modal is still present"
  step 'expect service commitments modal is not present'
end

Then /^expect form 3811 modal is present$/ do
  expect(SdcMail.modals.form_3811.title).to be_present, "Form 3811 modal is not present"
end

Then /^expect form 3811 modal is not present$/ do
  expect(SdcMail.modals.form_3811.title).not_to be_present, "Form 3811 modal is still present"
end

Then /^close form 3811 modal$/ do
  step 'expect form 3811 modal is present'
  SdcMail.modals.form_3811.x_btn.click
  step 'expect form 3811 modal is not present'
end

Then /^expect label 200 modal is present$/ do
  expect(SdcMail.modals.label_200.title).to be_present, "Label 200 modal is not present"
end

Then /^expect label 200 modal is not present$/ do
  expect(SdcMail.modals.label_200.title).not_to be_present, "Label 200 modal is still present"
end

Then /^close label 200 modal$/ do
  step 'expect label 200 modal is present'
  SdcMail.modals.label_200.x_btn.click
  step 'expect label 200 modal is not present'
end