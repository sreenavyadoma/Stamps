Feature: WebReg Fields Validation when user tabs to next field
  For any field listed as required, when validation occurs, the following error should be shown if the field is incomplete (i.e. blank text field or list with default value):
  “This field is required”. The test checks the error message as user tabs to a next field.

  Background:

    Given I launched the default browser

  @webreg_fields_validation_tab
  Scenario:
    Then WebReg Profile: Load Registration Page
    Then WebReg Profile: Tab
    Then WebReg Profile: Set Password to :tab
    Then WebReg Profile: Tab
    Then WebReg Profile: Expect Email Help Block is This field is required
    Then WebReg Profile: Tab

    #Then WebReg Profile: Set Email to missing@comma
    #Then WebReg Profile: Expect Email Help Block is Valid email address required

    Then WebReg Profile: Expect User ID Help Block is This field is required
    Then WebReg Profile: Tab
    Then WebReg Profile: Expect Password Help Block is This field is required
    Then WebReg Profile: Tab
    Then WebReg Profile: Expect Re-Type Password Help Block is This field is required
    Then WebReg Profile: Tab
    Then WebReg Profile: Expect How will you use Stamps.com Help Block is This field is required
    Then WebReg Profile: Tab
    Then WebReg Profile: Tab
    Then WebReg Profile: Tab
    Then WebReg Profile: Expect 1st Question Help Block is This field is required
    Then WebReg Profile: Tab
    Then WebReg Profile: Expect 1st Answer Help Block is This field is required
    Then WebReg Profile: Tab
    Then WebReg Profile: Expect 2nd Question Help Block is This field is required
    Then WebReg Profile: Tab
    Then WebReg Profile: Expect 2nd Answer Help Block is This field is required

    Then WebReg Profile: Load Registration Page
    Then WebReg Profile: Set User ID and Email to Random Value

    Then WebReg Profile: Set Password to pass111
    Then WebReg Profile: Set Re-Type password to pass111
    Then WebReg Profile: Set How will you use Stamps.com to Both Mailing and Shipping
    Then WebReg Profile: Set Referrer Name to Already used in office
    Then WebReg Profile: Set 1st Question to What is your mother's maiden name
    Then WebReg Profile: Set 1st Answer to stamps
    Then WebReg Profile: Set 2nd Question to What was your high school mascot
    Then WebReg Profile: Set 2nd Answer to stamps

    Then WebReg Profile: Continue to Mailing Information Page
    Then WebReg Membership: Tab
    Then WebReg Membership: Tab
    Then WebReg Membership: Expect First Name Help Block is This field is required
    Then WebReg Membership: Tab
    Then WebReg Membership: Expect Last Name Help Block is This field is required
    Then WebReg Membership: Tab
    Then WebReg Membership: Tab
    Then WebReg Membership: Expect Address Help Block is This field is required
    Then WebReg Membership: Tab
    Then WebReg Membership: Expect City Help Block is This field is required
    Then WebReg Membership: Tab
    Then WebReg Membership: Expect State Help Block is This field is required
    Then WebReg Membership: Tab
    Then WebReg Membership: Tab
    Then WebReg Membership: Expect Phone Help Block is This field is required
    Then WebReg Membership: Tab
    Then WebReg Membership: Tab
    Then WebReg Membership: Expect Cardhoder name Help Block is This field is required
    Then WebReg Membership: Tab
    Then WebReg Membership: Expect Card number Help Block is This field is required
    Then WebReg Membership: Tab
    Then WebReg Membership: Tab
    Then WebReg Membership: Tab
    Then WebReg Membership: Expires Help Block is This field is required
    Then WebReg Membership: Tab
    Then WebReg Membership: Tab
    Then WebReg Membership: Set Billing address same as mailing address to Unchecked
    Then WebReg Membership: Tab
    Then WebReg Membership: Tab
    Then WebReg Membership: Expect Billing Address Help Block is This field is required
    Then WebReg Membership: Tab
    Then WebReg Membership: Expect Billing City Help Block is This field is required
    Then WebReg Membership: Tab
    Then WebReg Membership: Expect Billing State Help Block is This field is required
    Then WebReg Membership: Tab
    Then WebReg Membership: Expect Billing Zip Help Block is This field is required
    Then WebReg Membership: Tab
    Then WebReg Membership: Submit
    Then WebReg Membership: Expect Terms & Conditions Help Block is You must agree to the Terms & Conditions to proceed.
