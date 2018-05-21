module SdcMail
  ##
  # Print Media helper
  module SdcPrintMediaHelper
    def to_sym(str)
      unless @selected_hash
        @selected_hash = {}
        @selected_hash['Stamps'] = :stamps
        @selected_hash['Shipping Label - 8 ½" x 11" Paper'] = :shipping_label_8x11
        @selected_hash['Shipping Label - SDC-1200, 4 ¼" x 6 ¾"'] = :shipping_label_sdc_1200
        @selected_hash['Shipping Label - 5 ½" x 8 ½"'] = :shipping_label_5x8
        @selected_hash['Envelope - #10, 4 ⅛" x 9 ½"'] = :envelope_10
        @selected_hash['Envelope - #9, 3 ⅞" x 8 ⅞"'] = :envelope_9
        @selected_hash['Envelope - #A9, 5 ¾" x 8 ¾"'] = :envelope_a9
        @selected_hash['Envelope - #6, 3 ⅝" x 6 ½"'] = :envelope_6
        @selected_hash['Envelope - #A2, 4 ⅜" x 5 ¾"'] = :envelope_a2
        @selected_hash['Envelope - #7, 3 ⅞" x 7 ½"'] = :envelope_7
        @selected_hash['Envelope - #11, 4 ½" x 10 ⅜"'] = :envelope_11
        @selected_hash['Envelope - #12, 4 ¾" x 11"'] = :envelope_12
        @selected_hash['Certified Mail Label - SDC-3610'] = :certified_mail_sdc_3610
        @selected_hash['Certified Mail Label - SDC-3710'] = :certified_mail_sdc_3710
        @selected_hash['Certified Mail Label - SDC-3910'] = :certified_mail_sdc_3910
        @selected_hash['Certified Mail Label - SDC-3930'] = :certified_mail_sdc_3930
        @selected_hash['Certified Mail #11 Envelope - SDC-3810'] = :certified_mail_sdc_3810
        @selected_hash['Roll - 4" x 6" Shipping Label'] = :roll_4x6
        @selected_hash['Roll - 4 ⅛" x 6 ¼" Shipping Label'] = :roll_4_18x6_34
        @selected_hash
      end
      @selected_hash[str]
    end
    module_function :to_sym
  end
end
