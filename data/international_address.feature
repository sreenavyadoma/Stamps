
Feature:  B-01813 - Allow Int'l and APO/FPO Printing (CN22 and CP72)

  Background:
    * I am signed in as a batch shipper

  @international_address
  Scenario:  1 User Enters International Address, User Changes Ship-To Country, Ship-To Country is NOT United States, ser Edits Component Int'l Address Fields, Field Attributes
    * Add new order
    * Set Ship-To country to Canada
    * Expect Single Order Form International Address fields are visible
    * Expect Single Order Form Tracking field is hidden
    * Expect Single Order Form Dimensions field is hidden
    * Expect Single Order Form Ship To field is hidden

    * Expect International Ship-To Name Field Attributes are correct
    * Expect International Ship-To Company Field Attributes are correct
    * Expect International Ship-To Address 1 Field Attributes are correct
    * Expect International Ship-To Address 2 Field Attributes are correct
    * Expect International Ship-To City Field Attributes are correct
    * Expect International Ship-To Province Field Attributes are correct
    * Expect International Ship-To Postal Code Field Attributes are correct
    * Expect International Ship-To Phone Field Attributes are correct
    * Expect International Ship-To Email Field Attributes are correct

    * Open Customs Form

    * Expect Customs Form field Package Contents behavior is correct
    * Expect Customs Form field Non-Delivery Options behavior is correct
    * Expect Customs Form field Internal Transaction # behavior is correct
    * Expect Customs Form field ITN# behavior is correct
    * Expect Customs Form field More Info behavior is correct
    * Expect Customs Form field License # behavior is correct
    * Expect Customs Form field Certificate # behavior is correct
    * Expect Customs Form field Invoice # behavior is correct
    * Expect Customs Form field Privacy Act Statement Checkbox behavior is correct
    * Expect Customs Form field Item Description behavior is correct
    * Expect Customs Form field Qty. behavior is correct
    * Expect Customs Form field Unit Price behavior is correct
    * Expect Customs Form field Unit Weight (lbs.) behavior is correct
    * Expect Customs Form field Unit Weight (oz.) behavior is correct
    * Expect Customs Form field HS Tariff behavior is correct
    * Expect Customs Form field Origin behavior is correct
    * Expect Customs Form field Total Weight behavior is correct
    * Expect Customs Form field Total Value behavior is correct

    * Set International Ship-To Name to random
    * Set International Ship-To Company to random
    * Set International Ship-To Address 1 to random
    * Set International Ship-To Address 2 to random
    * Set International Ship-To City to random
    * Set International Ship-To Province to random
    * Set International Ship-To Postal Code to random
    * Set International Ship-To Phone to random
    * Set International Ship-To Email to random
