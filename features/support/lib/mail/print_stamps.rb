# encoding: utf-8
module Stamps
  module Mail

    class StampsFormView < MailForm
      attr_reader :quantity, :reference_number, :cost_code

      def initialize param
        super param
        @quantity ||= Quantity.new param
        @reference_number ||= TextBoxElement.new browser.text_field name: "referenceNumber"
        @cost_code ||= CostCode.new param
      end

      def preview_image serial_prefix
        case serial_prefix.upcase

          when 'A'
            image = ElementWrapper.new browser.div css: "div[style*='traditional-bk.gif']"
          when 'B'
            image = ElementWrapper.new browser.div css: "div[style*='bseries-bk.gif']"
          when 'C'
            image = ElementWrapper.new browser.div css: "div[style*='standard-bk.gif']"
          when 'K'
            image = ElementWrapper.new browser.div css: "div[style*='themed-bk.gif']"
          when 'M'
            image = ElementWrapper.new browser.div css: "div[style*='landscape-bk.gif']"
          when 'P'
            image = ElementWrapper.new browser.div css: "div[style*='portrait-bk.gif']"
          when 'R'
            image = ElementWrapper.new browser.div css: "div[style*='return-bk.gif']"
          when 'V'
            image = ElementWrapper.new browser.div css: "div[style*='standard-bk.gif']"
          when 'W'
            image = ElementWrapper.new browser.div css: "div[style*='PromoPaper20-bk.gif']"
          when 'L'
            image = ElementWrapper.new browser.div css: "div[style*='landscape-bk.gif']"
          when 'S'
            image = ElementWrapper.new browser.div css: "div[style*='sordSeries-bk.gif']"
          else
            logger.info "Invalid Serial Number #{serial_prefix}"
            image = ElementWrapper.new browser.div css: "div[style*='traditional-bk.gif']"
        end

      end

      def print_all
        checkbox_field = browser.text_field css: "input[class*=sdc-previewpanel-printallcheckbox]"
        verify_fields = browser.inputs css: "table[id^=checkboxfield][class*=x-form-type-checkbox]"
        verify_field = verify_fields[8]

        Stamps::Browser::CheckboxElement.new checkbox_field, verify_field, "class", "checked"
      end

    end

    class CalculatePostageAmount < Browser::Modal
      attr_reader :weight, :extra_services

      def initialize param
        super param
        @weight ||= Weight.new param
        @extra_services ||= ExtraServices.new param
      end
    end

    class SpecifyPostageAmount < Browser::Modal
      attr_reader :stamp_amount

      def initialize param
        super param
        @stamp_amount ||= StampAmount.new param
      end
    end

    class NetStampsDropList < Browser::Modal
      attr_reader :text_box, :drop_down

      def initialize param
        super param
        @text_box ||= TextBoxElement.new browser.text_field name: "nsService"
        @drop_down ||= ElementWrapper.new browser.div css:'table[id^=netstampsservicedroplist-][id$=-triggerWrap]>tbody>tr>td>div[role=button]'
      end

      def select selection
        logger.info "Select Service #{selection}"
        box = text_box
        button = drop_down
        if selection == "Media Mail (2 - 3 Days)"
          selection_label = ElementWrapper.new browser.div css: "div[data-qtip*='Media Mail (2 - 9 Days)']"
        else
          selection_label = ElementWrapper.new browser.div css: "div[data-qtip*='#{selection}']"
        end

        10.times {
          begin
            button.safe_click #unless selection_label.present?
            selection_label.scroll_into_view
            selection_label.safe_click
            selected_service = box.text
            if selected_service == "First Class (1 - 3 Days)"
              selected_service = "First Class Mail (1 - 3 Days)"
            end
            logger.info "Selected Service #{selected_service} - #{(selected_service.include? selection)?"done": "service not selected"}"
            break if selected_service.include? selection
          rescue
            #ignore
          end
        }
        logger.info "#{selection} service selected."
        selection_label
      end
    end

    class NetStamps < MailForm
      attr_reader :specify_postage, :calculate_postage, :serial, :calculate_postage_service, :form_view, :drop_list

      def initialize param
        super param
        @specify_postage ||= SpecifyPostageAmount.new param
        @calculate_postage||= CalculatePostageAmount.new param
        @serial ||= TextBoxElement.new browser.text_field id: "sdc-mainpanel-nsserialtextfield-inputEl"
        @calculate_postage_service||= Service.new param
        @drop_list ||= NetStampsDropList.new param
        @form_view ||= StampsFormView.new param
      end

      def calculate_postage_amount
        radio_element = browser.input id: 'sdc-mainpanel-calculatepostageradio-inputEl'
        verify_element = browser.table id: 'sdc-mainpanel-calculatepostageradio'
        checkbox = CheckboxElement.new radio_element, verify_element, "class", "checked"
        checkbox.check
        raise "Unabled to select radio button Specify Postage Amount" unless checkbox.checked?
        calculate_postage
      end

      def specify_postage_amount
        radio_element = browser.input id: "sdc-mainpanel-specifypostageradio-inputEl"
        verify_element = browser.table id: 'sdc-mainpanel-specifypostageradio'
        checkbox = CheckboxElement.new radio_element, verify_element, "class", "checked"
        checkbox.check
        raise "Unabled to select radio button Specify Postage Amount" unless checkbox.checked?
        specify_postage
      end
    end
  end
end
