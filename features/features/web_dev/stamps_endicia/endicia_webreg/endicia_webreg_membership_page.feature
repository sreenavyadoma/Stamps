Feature: Endicia WebReg: Membership Page

  Background:
    Given Start test driver

  @ewwr_membership_page_ui_validation
  Scenario: Membership Page Validation

    Then WL: navigates to default registration page for endicia with the following offer id 707

    # Profile Page
    Then WL: set profile page default values
    Then WL: click profile page continue button

    # Membership Page
    # Membership Page Validate Help block tooltips
    Then WL: expect membership page billing address same as mailing address is checked
    Then WL: uncheck membership page billing address same as mailing address
    Then WL: click membership page submit button
    Then WL: expect membership page header to be Set up your personal Post Office

    Then WL: expect membership page first name tooltip to be This field is required
    Then WL: expect membership page last name tooltip to be This field is required
    Then WL: expect membership page address tooltip to be This field is required
    Then WL: expect membership page city tooltip to be This field is required
    Then WL: expect membership page state tooltip to be This field is required
    Then WL: expect membership page phone tooltip to be This field is required
    Then WL: expect membership page cardholder's name tooltip to be This field is required
    Then WL: expect membership page credit card number tooltip to be This field is required
    Then WL: expect membership page month tooltip to be This field is required
    Then WL: expect membership page year tooltip to be This field is required

    # Membership Page Billing Address Help block tooltips
    Then WL: expect membership page billing address tooltip to be This field is required
    Then WL: expect membership page billing city tooltip to be This field is required
    Then WL: expect membership page billing state tooltip to be This field is required
    Then WL: expect membership page billing zip tooltip to be This field is required

    #Membership Page Terms & Conditions Help block tooltips
    Then WL: expect membership page terms & conditions tooltip to be You must agree to the Terms & Conditions to proceed.

    # Membership Page tooltips with In-valid inputs
    Then pause for 1 second
    Then WL: set membership page first name to 1
    Then WL: set membership page last name to 2
    Then WL: set membership page phone to 128889
    Then WL: set membership page credit card number to 1234
    Then WL: click membership page submit button
    Then WL: expect membership page first name tooltip to be Invalid character in name
    Then WL: expect membership page last name tooltip to be Invalid character in name
    Then WL: expect membership page credit card number tooltip to be Invalid credit card number

    # Membership Page Valid Inputs
    Then pause for 1 second
    Then WL: set membership page first name to random value
    Then WL: expect membership page first name is correct

    Then WL: set membership page last name to random value
    Then WL: expect membership page last name is correct

    Then WL: set membership page company to random value
    Then WL: expect membership page company is correct

    Then WL: set membership page address to 1350 Market Street Apt 2901
    Then WL: expect membership page address is correct

    Then WL: set membership page city to San Francisco
    Then WL: expect membership page city is correct

    Then WL: select membership page state CA
    Then WL: expect membership page state is correct

    Then WL: set membership page zip to 94102
    Then WL: expect membership page zip is correct

    Then WL: set membership page phone to random value
    Then WL: expect membership page phone is correct

    #Credit Card
    Then WL: expect membership page credit card endicia logo is present
    Then WL: expect membership page credit card usps logo is present
    Then WL: expect membership page credit card authorization text to be
    """
    Postage Account
    Credit Card Authorization
    """

    Then WL: set membership page cardholder's name to random value
    Then WL: expect membership page cardholder's name is correct

    Then WL: set membership page credit card number to 4111111111111111
    Then WL: expect membership page credit card number is correct
    Then WL: expect membership page credit card visa is present

    Then WL: set membership page credit card number to 5111111111111111
    Then WL: expect membership page credit card number is correct
    Then WL: expect membership page credit card mastercard is present

    Then WL: set membership page credit card number to 6011363662993134
    Then WL: expect membership page credit card number is correct
    Then WL: expect membership page credit card discover is present

    Then WL: set membership page credit card number to 348871178715194
    Then WL: expect membership page credit card number is correct
    Then WL: expect membership page credit card american express is present

    Then WL: select membership page credit card month Dec (12)
    Then WL: select membership page credit card month Nov (11)
    Then WL: select membership page credit card month Oct (10)
    Then WL: select membership page credit card month Sep (09)
    Then WL: select membership page credit card month Aug (08)
    Then WL: select membership page credit card month Jul (07)
    Then WL: select membership page credit card month Jun (06)
    Then WL: select membership page credit card month May (05)
    Then WL: select membership page credit card month Apr (04)
    Then WL: select membership page credit card month Mar (03)
    Then WL: select membership page credit card month Feb (02)
    Then WL: select membership page credit card month Jan (01)

    Then WL: expect membership page month is correct

    Then WL: set membership page credit card year to this year plus 1
    Then WL: set membership page credit card year to this year plus 2
    Then WL: select membership page credit card year 2026
    Then WL: expect membership page credit card year is correct

  # Verify Billing Address present and Validate fields
    Then WL: expect membership page billing header to be present
    Then WL: expect membership page billing address to be present
    Then WL: expect membership page billing city to be present
    Then WL: expect membership page billing state to be present
    Then WL: expect membership page billing zip to be present

    Then WL: check membership page billing address same as mailing address
    Then WL: expect membership page billing address same as mailing address is checked
    Then WL: expect membership page billing header not to be present
    Then WL: expect membership page billing address not to be present
    Then WL: expect membership page billing city not to be present
    Then WL: expect membership page billing state not to be present
    Then WL: expect membership page billing zip not to be present

    Then WL: uncheck membership page billing address same as mailing address

    Then WL: set membership page billing address to 1350 Market Street Apt 2901
    Then WL: expect membership page billing address is correct
    Then WL: set membership page billing city to San Francisco
    Then WL: expect membership page billing city is correct
    Then WL: select membership page billing state CA
    Then WL: expect membership page billing state is correct
    Then WL: set membership page billing zip to 94102
    Then WL: expect membership page billing zip is correct

    Then WL: check membership page billing address same as mailing address
    Then WL: expect membership page terms & conditions is unchecked
    Then WL: check membership page terms & conditions
    Then WL: expect membership page terms & conditions is checked

    #Verify Side Content
    Then WL: expect membership page need mailing info header to be
    """
    Why do you need my mailing information?
    """

    Then WL: expect membership page need mailing info paragraph to be
    """
    Since you are being issued a license to print official U.S. postage, the USPS requires you to register the name, telephone number and physical address from which your postage will be printed. This information will be used to create your Endicia account and to calculate the correct postage rates. Rest assured, your information is safe with us. We take identity protection seriously. Our advanced encryption technology keeps your information safe and secure.
    """

    Then WL: expect membership page change mailing address header to be
    """
    Can I change my mailing address?
    """

    Then WL: expect membership page change mailing address paragraph to be
    """
    Yes. If you move to a new location your Endicia account will follow you. Simply change the address for your postage license in the Endicia settings. This is very important since postage rates are calculated based on where the mail is sent from.
    """

    Then WL: expect membership page outside my office header to be
    """
    Can I use my Endicia account outside my office?
    """

    Then WL: expect membership page outside my office paragraph to be
    """
    Yes, with Endicia you can mail and ship from anywhere, whether it’s your office, your home or your hotel room. Just be sure to set the zip code of your location before printing postage.
    """

    Then WL: expect membership page credit card information safe header to be
    """
    Is my credit card information safe?
    """

    Then WL: expect membership page credit card information safe paragraph to be
    """
    Definitely. We use the highest level SSL encryption technology to secure all commerce transactions.
    """

    Then WL: expect membership page pricing and billing header to be
    """
    Pricing and billing details
    """


    Then WL: expect membership page pricing and billing paragraph to be
    """
    If you decide to continue past the trial, you will be charged a service fee of just $plan_rate per month. This includes the month following registration. For your convenience, your Endicia service will continue uninterrupted unless you decide to cancel. No service fee will be charged if you cancel within the trial period. Your credit card may also be used to pay for postage and optional services.
    """

    Then WL: expect membership page cancel anytime header to be
    """
    Cancel anytime
    """

    Then WL: expect membership page cancel anytime paragraph to be
    """
    Cancel online or simply call us toll-free at 1-855-608-2677, M-F, 6am-6pm PST.
    """

    Then WL: uncheck membership page terms & conditions
    Then WL: expect membership page terms & conditions is unchecked
    Then WL: check membership page terms & conditions
    Then WL: click membership page terms & conditions link
    Then WL: expect membership page terms and conditions modal is present
    Then WL: click membership page terms & conditions modal x button
