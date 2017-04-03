Feature: WebReg Membership page validation theme_1632

  Background:
    Given I launched default browser

  @membership_page_ui_validation
  Scenario:
    Then Load WebReg Profile page
    Then set WebReg Profile email textbox to email
    Then set WebReg Profile username textbox to username
    Then set WebReg Profile password textbox to password
    Then set WebReg Profile retype password textbox to password
    Then set WebReg Profile Usage Type list of values to contain Business Use - Mostly mailing (letters/postcards/flats
    Then on WebReg Profile page, continue to Membership page
    Then expect WebReg navigation bar Stamps logo exists
    Then expect WebReg navigation bar USPS logo exists
    Then expect WebReg Membership bread crumbs to contain Profile
    Then expect WebReg Membership bread crumbs to contain Membership
    Then expect WebReg Membership bread crumbs to contain Choose Supplies
    Then expect WebReg Membership header contain Set up your personal Post Office
    Then expect WebReg Membership first name textbox exists
    Then expect WebReg Membership last name textbox exists
    Then expect WebReg Membership company textbox exists
    Then expect WebReg Membership address textbox exists
    Then expect WebReg Membership city textbox exists
    Then expect WebReg Membership state dropdown exists
    Then expect WebReg Membership zip textbox exists
    Then expect WebReg Membership phone textbox exists
    Then expect WebReg Membership stamps logo exists
    Then expect WebReg Membership usps logo exists
    Then expect WebReg Membership paragraph to contain Postage Account Credit Card Authorization
    Then expect WebReg Membership cardholders name textbox exists
    Then expect WebReg Membership credit card number textbox exists
    Then expect WebReg Membership month dropdown exists
    Then expect WebReg Membership year dropdown exists
    Then expect WebReg Membership Billing address same as mailing address checkbox exists
          and is checkmarked
    Then expect WebReg Membership I agree to the Terms and conditions and Pricing details checkbox exists
          and is checkmarked

    Then expect WebReg Membership back button exists
    Then expect WebReg Membership submit button exists
    Then expect WebReg Membership why do you need my mailing information to contain:
    """
    Since you are being issued a license to print official U.S. postage, the USPS requires you to register the name, telephone number and physical address from which your postage will be printed. This information will be used to create your Stamps.com account and to calculate the correct postage rates. Rest assured, your information is safe with us. We take identity protection seriously. Our advanced encryption technology keeps your information safe and secure.
    """
    Then expect WebReg Membership Can I change my mailing address to contain:
    """
    Yes. If you move to a new location your Stamps.com account will follow you. Simply change the address for your postage license in the Stamps.com settings. This is very important since postage rates are calculated based on where the mail is sent from.
    """
    Then expect WebReg Membership Can I use my Stamps.com account outside my office to contain:
    """
    Yes, with Stamps.com you can mail and ship from anywhere, whether it’s your office, your home or your hotel room. Just be sure to set the zip code of your location before printing postage.
    """
    Then expect WebReg Membership Is my credit card information safe to contain:
    """
    Definitely. We use the highest level SSL encryption technology to secure all commerce transactions.
    """
    Then expect WebReg Membership Pricing and billing details to contain:
    """
    If you decide to continue past the trial, you will be charged a service fee of just $15.99 per month. This includes the month following registration. For your convenience, your Stamps.com service will continue uninterrupted unless you decide to cancel. No service fee will be charged if you cancel within the trial period. Your credit card may also be used to pay for postage and optional services.
    """
    Then expect WebReg Membership Cancel anytime to contain:
    """
    Cancel online or simply call us toll-free at 1-855-608-2677, M-F, 6am-6pm PST
    """
    Then expect WebReg Membership Bonus Offer Details link exists
      and is clickable
    Then expect WebReg Membership Privacy Policy link exists
      and is clickable
    Then expect WebReg Membership copyright link exists
      and is clickable
    Then expect WebReg Profile Norton logo exists
    Then expect WebReg Profile TRUSTe logo exists
    Then expect WebReg Profile LIVE chat button exists
















  T
