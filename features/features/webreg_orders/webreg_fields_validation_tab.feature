Feature: Registration Fields Validation when user tabs to next field
  For any field listed as required, when validation occurs, the following error should be shown if the field is incomplete (i.e. blank text field or list with default value):
  “This field is required”. The test checks the error message as user tabs to a next field.

  Background:

    Given I launched the default browser

  @registration_fields_validation_tab
  Scenario:
    Then I loaded default registration profile page
    Then On Registration Profile page, Tab
    Then set Registration Profile Password to :tab
    Then On Registration Profile page, Tab
    Then On Registration Profile page, expect Email Help Block is This field is required
    Then On Registration Profile page, Tab

    #Then set Registration Profile Email to missing@comma
    #Then On Registration Profile page, expect Email Help Block is Valid email address required

    Then On Registration Profile page, expect User ID Help Block is This field is required
    Then On Registration Profile page, Tab
    Then On Registration Profile page, expect Password Help Block is This field is required
    Then On Registration Profile page, Tab
    Then On Registration Profile page, expect Re-Type Password Help Block is This field is required
    Then On Registration Profile page, Tab
    Then On Registration Profile page, expect How will you use Stamps.com Help Block is This field is required
    Then On Registration Profile page, Tab
    Then On Registration Profile page, Tab
    Then On Registration Profile page, Tab
    Then On Registration Profile page, expect 1st Question Help Block is This field is required
    Then On Registration Profile page, Tab
    Then On Registration Profile page, expect 1st Answer Help Block is This field is required
    Then On Registration Profile page, Tab
    Then On Registration Profile page, expect 2nd Question Help Block is This field is required
    Then On Registration Profile page, Tab
    Then On Registration Profile page, expect 2nd Answer Help Block is This field is required

    Then I loaded default registration profile page
    Then set Registration Profile User ID and Email to Random Value

    Then set Registration Profile Password to pass111
    Then set Registration Profile Re-Type password to pass111
    Then set Registration Profile How will you use Stamps.com to Both Mailing and Shipping
    Then set Registration Profile Referrer Name to Already used in office
    Then set Registration Profile 1st Question to What is your mother's maiden name
    Then set Registration Profile 1st Answer to stamps
    Then set Registration Profile 2nd Question to What was your high school mascot
    Then set Registration Profile 2nd Answer to stamps

    Then On Registration Profile page, continue to Mailing Information page
    Then On Registration Membership page, Tab
    Then On Registration Membership page, Tab
    Then On Registration Membership page, expect First Name Help Block is This field is required
    Then On Registration Membership page, Tab
    Then On Registration Membership page, expect Last Name Help Block is This field is required
    Then On Registration Membership page, Tab
    Then On Registration Membership page, Tab
    Then On Registration Membership page, expect Address Help Block is This field is required
    Then On Registration Membership page, Tab
    Then On Registration Membership page, expect City Help Block is This field is required
    Then On Registration Membership page, Tab
    Then On Registration Membership page, expect State Help Block is This field is required
    Then On Registration Membership page, Tab
    Then On Registration Membership page, Tab
    Then On Registration Membership page, expect Phone Help Block is This field is required
    Then On Registration Membership page, Tab
    Then On Registration Membership page, Tab
    Then On Registration Membership page, expect Cardhoder name Help Block is This field is required
    Then On Registration Membership page, Tab
    Then On Registration Membership page, expect Card number Help Block is This field is required
    Then On Registration Membership page, Tab
    Then On Registration Membership page, Tab
    Then On Registration Membership page, Tab
    Then On Registration Membership page, Expires Help Block is This field is required
    Then On Registration Membership page, Tab
    Then On Registration Membership page, Tab
    Then set Registration Membership page Billing address same as mailing address to Unchecked
    Then On Registration Membership page, Tab
    Then On Registration Membership page, Tab
    Then On Registration Membership page, expect Billing Address Help Block is This field is required
    Then On Registration Membership page, Tab
    Then On Registration Membership page, expect Billing City Help Block is This field is required
    Then On Registration Membership page, Tab
    Then On Registration Membership page, expect Billing State Help Block is This field is required
    Then On Registration Membership page, Tab
    Then On Registration Membership page, expect Billing Zip Help Block is This field is required
    Then On Registration Membership page, Tab
    Then On Registration Membership page, click Submit
    Then On Registration Membership page, expect Terms & Conditions Help Block is You must agree to the Terms & Conditions to proceed.
