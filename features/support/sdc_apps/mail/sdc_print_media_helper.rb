module SdcMail
  module SdcPrintMediaHelper
    class << self
      def selected_hash
        return @selected_hash if @selected_hash
        @selected_hash = {}
        @selected_hash['Stamps'] = 'Stamps'
        @selected_hash['Shipping Label - Paper'] = 'Shipping Label - 8 ½" x 11" Paper'
        @selected_hash['Shipping Label - SDC-1200'] = 'Shipping Label - SDC-1200, 4 ¼" x 6 ¾"'
        @selected_hash['Shipping Label - 5x8'] = 'Shipping Label - 5 ½" x 8 ½"'
        @selected_hash['Envelope - 10'] = 'Envelope - #10, 4 ⅛" x 9 ½"'
        @selected_hash['Envelope - 9'] = 'Envelope - #9, 3 ⅞" x 8 ⅞"'
        @selected_hash['Envelope - A9'] = 'Envelope - #A9, 5 ¾" x 8 ¾"'
        @selected_hash['Envelope - 6'] = 'Envelope - #6, 3 ⅝" x 6 ½"'
        @selected_hash['Envelope - A2'] = 'Envelope - #A2, 4 ⅜" x 5 ¾"'
        @selected_hash['Envelope - 7'] = 'Envelope - #7, 3 ⅞" x 7 ½"'
        @selected_hash['xxxx'] = 'Envelope - #11, 4 ½" x 10 ⅜"'
        @selected_hash['xxxx'] = 'xxxx'
        @selected_hash['xxxx'] = 'xxxx'
        @selected_hash['xxxx'] = 'xxxx'
        @selected_hash['xxxx'] = 'xxxx'
        @selected_hash['xxxx'] = 'xxxx'
        @selected_hash['xxxx'] = 'xxxx'
        @selected_hash['xxxx'] = 'xxxx'
        @selected_hash['xxxx'] = 'xxxx'
        @selected_hash['xxxx'] = 'xxxx'
        @selected_hash['xxxx'] = 'xxxx'
        @selected_hash['xxxx'] = 'xxxx'
        @selected_hash['xxxx'] = 'xxxx'
        @selected_hash['xxxx'] = 'xxxx'
        @selected_hash['xxxx'] = 'xxxx'
        @selected_hash['xxxx'] = 'xxxx'
        @selected_hash['xxxx'] = 'xxxx'
      end

      def selected(str)

      end

      def selected_sub_str(str)
        case(str)
        when /Shipping Label - Paper/
          return 'Paper'
        when /Shipping Label - SDC-1200/
          return 'SDC-1200'
        when /Shipping Label - 5x8/
          return 'Shipping Label - 5 '
        when /Envelope - 10/
          return 'Envelope - #10'
        when /Envelope - 9/
          return 'Envelope - #9'
        when /Envelope - A9/
          return 'Envelope - #A9'
        when /Envelope - 6/
          return 'Envelope - #6'
        when /Envelope - A2/
          return 'Envelope - #A2'
        when /Envelope - 7/
          return 'Envelope - #7'
        when /Envelope - 11/
          return 'Envelope - #11'
        when /Envelope - 12/
          return 'Envelope - #12'
        when /Certified Mail Label - SDC-3610/
          return 'SDC-3610'
        when /Certified Mail Label - SDC-3710/
          return 'SDC-3710'
        when /Certified Mail Label - SDC-3910/
          return 'SDC-3910'
        when /Certified Mail Label - SDC-3930/
          return 'SDC-3930'
        when /Certified Mail Label - SDC-3810/
          return 'SDC-3810'
        when /Certified Mail Label - SDC-3830/
          return 'SDC-3830'
        when /Roll 4x6/
          return 'Roll - 4'
        when /Roll 418x614/
          return 'Roll - 4 '
        when /Manage Printing Options/
          return 'Manage Printing Option...'
        when /Stamps/
          return 'Stamps'
        else
          raise "#{str} is not a valid print_media"
        end
      end


      def print_media(str)
        case(str)
        when /Certified Mail/
          return :certified_mail
        when /Shipping Label/
          return :label
        when /Envelope/
          return :envelope
        when /Roll/
          return :roll
        when /Manage Printing Options/
          return :manage_printing_options
        when /Stamps/
          return :stamps
        else
          raise "#{str} is not a valid print_media"
        end
      end

      def mpo_search_str(str)
        case(str)
        when /Stamps/
          return 'stamps'
        when /Shipping Label - Paper/
          return 'Shipping Label - 8 '
        when /Shipping Label - SDC-1200/
          return 'Shipping Label - SDC-1200'
        when /Shipping Label - 5x8/
          return 'Shipping Label - 5 '
        when /Envelope - 10/
          return 'Envelope - #10'
        when /Envelope - 9/
          return 'Envelope - #9'
        when /Envelope - A9/
          return 'Envelope - #A9'
        when /Envelope - 6/
          return 'Envelope - #6'
        when /Envelope - A2/
          return 'Envelope - #A2'
        when /Envelope - 7/
          return 'Envelope - #7'
        when /Envelope - 11/
          return 'Envelope - #11'
        when /Envelope - 12/
          return 'Envelope - #12'
        when /Certified Mail Label - SDC-3610/
          return 'Certified Mail Label - SDC-3610'
        when /Certified Mail Label - SDC-3710/
          return 'Certified Mail Label - SDC-3710'
        when /Certified Mail Label - SDC-3910/
          return 'Certified Mail Label - SDC-3910'
        when /Certified Mail Label - SDC-3930/
          return 'Certified Mail Label - SDC-3930'
        when /Certified Mail Label - SDC-3810/
          return 'Certified Mail #11 Envelope - SDC-3810'
        when /Certified Mail Label - SDC-3830/
          return 'Certified Mail #11 Envelope - SDC-3830'
        when /Roll 4x6/
          return 'Roll - 4" x 6" Shipping Label'
        when /Roll 418x614/
          return 'Roll - 4 '
        else
          raise "#{str} is not a valid print_media"
        end
      end

      def selection_field(str)
        case(str)
        when /Shipping Label - Paper/
          return 'Shipping Label - 8 '
        when /Shipping Label - SDC-1200/
          return 'Shipping Label - SDC-1200'
        when /Shipping Label - 5x8/
          return 'Shipping Label - 5 '
        when /Envelope - 10/
          return 'Envelope - #10'
        when /Envelope - 9/
          return 'Envelope - #9'
        when /Envelope - A9/
          return 'Envelope - #A9'
        when /Envelope - 6/
          return 'Envelope - #6'
        when /Envelope - A2/
          return 'Envelope - #A2'
        when /Envelope - 7/
          return 'Envelope - #7'
        when /Envelope - 11/
          return 'Envelope - #11'
        when /Envelope - 12/
          return 'Envelope - #12'
        when /Certified Mail Label - SDC-3610/
          return 'Certified Mail Label - SDC-3610'
        when /Certified Mail Label - SDC-3710/
          return 'Certified Mail Label - SDC-3710'
        when /Certified Mail Label - SDC-3910/
          return 'Certified Mail Label - SDC-3910'
        when /Certified Mail Label - SDC-3930/
          return 'Certified Mail Label - SDC-3930'
        when /Certified Mail Label - SDC-3810/
          return 'Certified Mail #11 Envelope - SDC-3810'
        when /Roll 4x6/
          return 'Roll - 4" x 6" Shipping Label'
        when /Roll 418x614/
          return 'Roll - 4 '
        when /Stamps/
          return 'stamps'
        else
          raise "#{str} is not a valid print_media"
        end
      end
    end
  end
end