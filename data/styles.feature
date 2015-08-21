  Feature: I want Batch and Print Postage to use the same design conventions] B-01682
    Open Style Guide: http://sdcintranet/ProductAndServiceOperations/ProductManagement/Product%20Management%20Documents/Web%20Client/Style%20Guide/Web%20Client%20Style%20Guide.docx

  Background:
    Given I am signed in as a Batch user

  Scenario: Font and tool tips
    * Right-click on page and inspect element
    * Expect batch font to be same as specified in section 3.1 of Style Guide


  Scenario: Tool tips

    * Hovering over sections with tool tips through out the Batch site,
  examples:
    * Click Add  button to add order
    * Click on Service drop down arrow
    * Hover over any of the services to get tool tip
    * Expect tool tip style to be same as specified in section 3.1 of Style Guide


  Scenario: Error Tool tips
    * Create an error on page
    * Hovering over a field in error or the error icon
    * Expect  error tool tips style to be same as specified in section 3.2.1 of Style Guide


  Scenario: Background on header
    * Go to header
    * Expect background color to be same as specified in section 4.0 of Style Guide

  Scenario: Links on header
    * Go to header
    * Expect links on header to be same as specified in section 4.1 of Style Guide

  Scenario: Icon only button
    * Find an Icon Only
    * Expect icon style to be same as specified in section 5.1.1 of Style Guide

  Scenario: Icon with text button
    * Find icon with text
    * Expect icon style to be same as specified in section 5.1.2 of Style Guide

  Scenario: Menu Button (Text Optional)
    * Find a menu button only
    * Expect menu button opens a menu when clicked.
    * Expect menu buttons have a dropdown arrow on their right

  Scenario: Split Button (Text Optional)
    * Find a Split Button
    * Expect clicking on the icon and/or text performs an action  (e.g. printing)
    * Expect clicking on the split line/dropdown arrow opens a menu (e.g. printing options)
    * Expect the split arrow icon shows its hover state separately from the rest of the button as shown on section 5.1.4 of Style Guide

  Scenario: Button Colors
    * Find a button
    * Expect button icon/text/color to be same as specified in section 5.2 of Style Guide

  Scenario: Button with text
    * Find a button
    * Expect button padding to be same as specified in section 5.3.1 of Style Guide

  Scenario: Button without text
    * Find a button
    * Expect button padding to be same as specified in section 5.3.2 of Style Guide

  Scenario: Grid
    * Main page see grid
    * Expect grid to be same as specified in section 6 of Style Guide

  Scenario: Grid Pagination Controls
    * Got to grid pagination
    * Expect grid to be same as specified in section 6.1 of Style Guide

  Scenario: Field Placeholder text
    * Go to a field
    * Expect placeholder text to be same as specified in section 7.1.1 of Style Guide

  Scenario: Fields highlight and focus color
    * Focus and highlight a field
    * Expect fields highlight and focus color to be same as specified in section 7.1.2 of Style Guide

  Scenario: Validation Errors
    * A validation error occurs
    * Expect validation error style to be same as specified in section 7.1.3 of Style Guide
    * Expect if the field is a text input field or dropdown menu, an error icon should be shown to the right of the field
    * Expect error icon style to be same as specified in section 7.1.3 of Style Guide

  Scenario: Disabled Elements
    * Find a disabled element
    * Expect disabled element style to be same as specified in section 7.1.4 of Style Guide

  Scenario: Dropdown field
    * Find a dropdown field
    * Expect dropdown field style to be same as specified in section 7.2 of Style Guide

  Scenario: Arrow Icon
    * Find an arrow icon
    * Expect arrow icon style to be same as specified in section 7.2.1 of Style Guide

  Scenario: Menu
    * Find a drop down menu
    * Expect rows and columns style to be same as specified in section 7.2.2 of Style Guide

  Scenario: Text Input
    * Input text in a field
    * Expect text style to be same as specified in section 7.3 of Style Guide

  Scenario: Text Area
    * Find Address text area
    * Expect text area style to be same as specified in section 7.4 of Style Guide

  Scenario: Numeric Spinner
    * Find numeric spinner ( e.g. Weight)
    * Expect numeric spinner style to be same as specified in section 7.5 of Style Guide

  Scenario: Date field
    * Find the Date field
    * Expect date field style to be same as specified in section 7.6 of Style Guide

  Scenario: Expanded date menu
    * Find date field and expand to view calendar
    * Expect date field/calendar to be same as specified in section 7.6.1 of Style Guide

  Scenario: Checkbox
    * Find a check box
    * Expect check or unchecked checkbox style to be same as specified in section 7.7 of Style Guide

  Scenario: Radio Button
    * Find a radio button
    * Expect radio button style to be same as specified in section 7.8 of Style Guide

  Scenario: Standard Button
    * Find a standard button
    * Expect standard button style to be same as specified in section 7.9 of Style Guide

  Scenario: Hover over button
    * Hover over a button
    * Expect when hovered over button, style to be same as specified in section 7.9.1 of Style Guide

  Scenario: Add item button
    * Button used to add items
    * Expect add item button style to be same as specified in section 7.10 of Style Guide

  Scenario: Delete /Remove items X button
    * X button used to delete/remove items
    * Expect X button style to be same as specified in section 7.11 of Style Guide

  Scenario: Label Expand/Collapse Tool
    * Form fields that have hidden or collapse beneath a field label, need to click to expand, revealing the hidden fields
    * Expect an address to be shown and style to be same as specified in section 7.12  and 7.12.1 of Style Guide
    * Expect clicking on it might reveal editable fields
    * Expect after expanding there will be a "Less" label to hide fields again
    * Expect the Less label  style to be same as specified in section 7.12.2 of Style Guide


  Scenario: Dialog
    * Open a dialog (e.g. Print)
    * Expect dialog box style to be same as specified in section 8 of Style Guide

  Scenario: Title bar on dialog
    * Open a dialog (e.g. Print)
    * Expect Title bar on dialog style to be same as specified in section 8.1 of Style Guide

  Scenario: Close button on dialog
    * Open a dialog (e.g. Print)
    * Expect dialog box close button style to be same as specified in section 8.1.1 of Style Guide

  Scenario: Footer on dialog
    * Open a dialog (e.g. Print)
    * Go to footer on dialog
    * Expect dialog footer style to be same as specified in section 8 of Style Guide

  Scenario: Footer primary button on dialog
    * Open a dialog (e.g. Print)
    * Go to footer primary button on dialog
    * Expect footer primary button on dialog footer style to be same as specified in section 8.2.1 of Style Guide

  Scenario: Footer secondary button on dialog
    * Open a dialog (e.g. Print)
    * Go to footer secondary button on dialog
    * Expect footer secondary button on dialog footer style to be same as specified in section 8.2.2 of Style Guide

  Scenario: Busy button
    * Open a dialog (e.g. Print)
    * Click print after selecting a printer
    * Expect busy button style to be same as specified in section 8.2.3 of Style Guide

  Scenario:  Error Dialog Icon
    * Error occurs on a dialog
    * Expect Error icon on the top-left of dialog
    * Expect Error icon style to be same as specified in section 8.2.3 of Style Guide

  Scenario: Filter Panel (left panel)
    * Go to left panel
    * Expect filter panel(left panel) style to be same as specified in section 9 of Style Guide

  Scenario: Filter Options (left panel)
    * Go to left panel
    * Expect option on filter panel style to be same as specified in section 9.1 of Style Guide

  Scenario: Filter count (left panel)
    * Go to left panel
    * Expect when expanding or collapsing filter style to be same as specified in section 9.1.2 of Style Guide

  Scenario: Splitter
    * Click add item and screens will be split to see orders on one side and add order form on other side
    * Expect page splitter style to be same as specified in section 9.2 and 10.1 of Style Guide


  Scenario: Details Panel (right panel)
    * Click add item to see details panel on right
    * Expect details panel style to be same as specified in section 10 of Style Guide
