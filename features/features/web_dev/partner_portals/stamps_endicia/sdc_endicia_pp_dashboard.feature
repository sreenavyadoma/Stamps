@sdc_endicia_pp_dashboard
Feature: PP-MVP: Header and Favicons
   
  Background:
    Given PP: a valid user is signed into the Partner Portal

  @sdc_endicia_pp_dashboard_header_and_favicons_validaiton
  Scenario: Large and Medium Viewports Header of the Partner Portal page
      Then PP: expect dashboard page Stamps Endicia Partner Portal Logo exists
      Then PP: click on Stamps Endicia Partner Portal logo
      Then PP: expect user is redirected to the Dashboard Page
