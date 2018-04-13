@sdc_endicia_pp_dashboard
Feature: PP-MVP: Header and Favicons
   
  Background:
    Given PP: a valid user is signed into the Partner Portal

  @sdc_endicia_pp_dashboard_header_and_favicons_validaiton
  Scenario: Large and Medium Viewports Header of the Partner Portal page
      Then PP: set dashboard page to large viewport
      Then PP: expect on dashboard page Stamps Endicia Partner Portal Logo exists
      Then PP: click on Stamps Endicia Partner Portal logo
      Then PP: expect user is redirected to the Dashboard Page

      Then PP: set dashboard page to medium viewport
      Then PP: expect on dashboard page Stamps Endicia Partner Portal Logo exists
      Then PP: click on Stamps Endicia Partner Portal logo
      Then PP: expect user is redirected to the Dashboard Page

      Then PP: set dashboard page to small viewport
      Then PP: expect on dashboard page displays hamburger menu
#      Then PP: scroll down
#      Then PP: expect on dashboard page header will stick to the top of the browser when user scrolls down
#      Then PP: click hamburger menu on dashboard page
#      Then PP: expect on dashabord page the X button to exists
#      Then PP: expect on dashboard page left panel extends from the left
#      Then PP: click on X button
#      Then PP: expect hamburger menu to reappear and left panel disappears
