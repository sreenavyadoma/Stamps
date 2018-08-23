Feature: Stamps Website: Header Footer

  Background:
    Given Start test driver

  @sdc_website_header_footer
  Scenario: Stamps Website: Header Footer UI Validation

    Then SDCW: navigate to home page

    ######## footer #######
    Then SDCW: expect stamps website footer usps logo exists
    Then SDCW: expect stamps website footer usps logo words is Stamps.com is an independent vendor of the USPS.
    Then SDCW: expect stamps website footer copyright exists
    Then SDCW: expect stamps website footer copyright text is Copyright © 1998-2018 Stamps.com Inc.
    Then SDCW: click footer copyright link
    Then SDCW: navigate back

    ### products ###
    Then SDCW: click footer small office mailers
    Then SDCW: navigate back
    Then SDCW: click footer online sellers
    Then SDCW: navigate back
    Then SDCW: click footer warehouse shippers
    Then SDCW: navigate back
    Then SDCW: click footer corporate postage solutions
    Then SDCW: navigate back
    Then SDCW: click footer photo stamps
    Then SDCW: click footer supplies

    ## support ###
    Then SDCW: click footer download software
    Then SDCW: navigate back
    Then SDCW: click footer customer support
    #Then SDCW: click footer how to videos
    Then SDCW: click footer faq
    Then SDCW: navigate back
    Then SDCW: click footer system status

  ### Company Stuff ###
#    Then SDCW: click footer
#    Then SDCW: click footer
#    Then SDCW: click footer
#    Then SDCW: click footer
#    Then SDCW: click footer
#    Then SDCW: click footer
#    Then SDCW: click footer
#    Then SDCW: click footer