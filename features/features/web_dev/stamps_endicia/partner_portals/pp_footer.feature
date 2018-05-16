Feature: PP-MVP: Footer

  Background:
    Given Start test driver

  @pp_footer
  Scenario: PP: Footer Validation

    #validate footer on Reset Passowrd page
    Then PP: a user navigates to Reset Password Page
    Then PP: expect footer to exists
    Then PP: expect copyright dates is 2017 - current year
    Then PP: click on Copyright Stamps.com link
    Then PP: expect https://www.stamps.com/site/copyright/ open in a new tab
    Then PP: click on Copyright Endicia link
    Then PP: expect https://www.endicia.com/LegalNotice/ open in a new tab
    Then PP: click on Stamps.com Privacy Policy link
    Then PP: expect https://www.stamps.com/privacy-policy/ open in a new tab
    Then PP: click on Endicia Privacy Policy link
    Then PP: expect https://www.endicia.com/policy/privacy-policy/ open in a new tab

    #validate footer on Reset Password Request Confirmation
    Then PP: a user navigates to Reset Password Request Confirmation
    Then PP: expect footer to exists
    Then PP: expect copyright dates is 2017 - current year
    Then PP: click on Copyright Stamps.com link
    Then PP: expect https://www.stamps.com/site/copyright/ open in a new tab
    Then PP: click on Copyright Endicia link
    Then PP: expect https://www.endicia.com/LegalNotice/ open in a new tab
    Then PP: click on Stamps.com Privacy Policy link
    Then PP: expect https://www.stamps.com/privacy-policy/ open in a new tab
    Then PP: click on Endicia Privacy Policy link
    Then PP: expect https://www.endicia.com/policy/privacy-policy/ open in a new tab

    #validate footer on Set Password Page
    Then PP: a user navigates to Set Password Page
    Then PP: expect footer to exists
    Then PP: expect copyright dates is 2017 - current year
    Then PP: click on Copyright Stamps.com link
    Then PP: expect https://www.stamps.com/site/copyright/ open in a new tab
    Then PP: click on Copyright Endicia link
    Then PP: expect https://www.endicia.com/LegalNotice/ open in a new tab
    Then PP: click on Stamps.com Privacy Policy link
    Then PP: expect https://www.stamps.com/privacy-policy/ open in a new tab
    Then PP: click on Endicia Privacy Policy link
    Then PP: expect https://www.endicia.com/policy/privacy-policy/ open in a new tab

  #validate footer on 404 Page
    Then PP: a user navigates to 404 Page
    Then PP: expect footer to exists
    Then PP: expect copyright dates is 2017 - current year
    Then PP: click on Copyright Stamps.com link
    Then PP: expect https://www.stamps.com/site/copyright/ open in a new tab
    Then PP: click on Copyright Endicia link
    Then PP: expect https://www.endicia.com/LegalNotice/ open in a new tab
    Then PP: click on Stamps.com Privacy Policy link
    Then PP: expect https://www.stamps.com/privacy-policy/ open in a new tab
    Then PP: click on Endicia Privacy Policy link
    Then PP: expect https://www.endicia.com/policy/privacy-policy/ open in a new tab

  #validate footer on 500 Page
    Then PP: a user navigates to 500 Page
    Then PP: expect footer to exists
    Then PP: expect copyright dates is 2017 - current year
    Then PP: click on Copyright Stamps.com link
    Then PP: expect https://www.stamps.com/site/copyright/ open in a new tab
    Then PP: click on Copyright Endicia link
    Then PP: expect https://www.endicia.com/LegalNotice/ open in a new tab
    Then PP: click on Stamps.com Privacy Policy link
    Then PP: expect https://www.stamps.com/privacy-policy/ open in a new tab
    Then PP: click on Endicia Privacy Policy link
    Then PP: expect https://www.endicia.com/policy/privacy-policy/ open in a new tab

  #validate footer on login page
    Then PP: A user navigates to the login page
    Then PP: expect footer does not exists

  #validate footer on Dashboard page
    Then PP: A user navigates to the login page
    Then PP: set login page email to env value
    Then PP: set login page password to env value
    Then PP: User clicks Log In
    Then PP: expect dashboard page header exist
    Then PP: expect footer to exists
    Then PP: expect copyright dates is 2017 - current year
    Then PP: click on Copyright Stamps.com link
    Then PP: expect https://www.stamps.com/site/copyright/ open in a new tab
    Then PP: click on Copyright Endicia link
    Then PP: expect https://www.endicia.com/LegalNotice/ open in a new tab
    Then PP: click on Stamps.com Privacy Policy link
    Then PP: expect https://www.stamps.com/privacy-policy/ open in a new tab
    Then PP: click on Endicia Privacy Policy link
    Then PP: expect https://www.endicia.com/policy/privacy-policy/ open in a new tab