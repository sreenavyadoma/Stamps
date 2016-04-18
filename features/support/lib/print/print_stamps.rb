# encoding: utf-8
module Print
  module Postage
    class Stamps < Print::Postage::PrintObject

      class StampsFormView < Print::Postage::PrintPostageObject

        def preview_image serial_prefix
          case serial_prefix

            when 'A'
              image = StampsLabel.new @browser.div :css => "div[style*='traditional-bk.gif']"
            when 'B'
              image = StampsLabel.new @browser.div :css => "div[style*='bseries-bk.gif']"
            when 'C'
              image = StampsLabel.new @browser.div :css => "div[style*='standard-bk.gif']"
            when 'K'
              image = StampsLabel.new @browser.div :css => "div[style*='themed-bk.gif']"
            when 'M'
              image = StampsLabel.new @browser.div :css => "div[style*='landscape-bk.gif']"
            when 'P'
              image = StampsLabel.new @browser.div :css => "div[style*='portrait-bk.gif']"
            when 'R'
              image = StampsLabel.new @browser.div :css => "div[style*='return-bk.gif']"
            when 'V'
              image = StampsLabel.new @browser.div :css => "div[style*='standard-bk.gif']"
            when 'W'
              image = StampsLabel.new @browser.div :css => "div[style*='PromoPaper20-bk.gif']"
            when 'L'
              image = StampsLabel.new @browser.div :css => "div[style*='landscape-bk.gif']"
            when 'S'
              image = StampsLabel.new @browser.div :css => "div[style*='sordSeries-bk.gif']"
            else
              log.info "Invalid Serial Number #{serial_prefix}"
              image = StampsLabel.new @browser.div :css => "div[style*='traditional-bk.gif']"
          end

        end

        def quantity
          Print::Postage::Quantity.new @browser
        end

        def print_all
          checkbox_field = @browser.input :css => "input[class*=sdc-previewpanel-printallcheckbox]"
          verify_fields = @browser.inputs :css => "table[id^=checkboxfield][class*=x-form-type-checkbox]"
          verify_field = verify_fields[8]

          Stamps::Browser::StampsCheckbox.new checkbox_field, verify_field, "class", "checked"
        end

        def reference_number
          StampsTextbox.new @browser.text_field :name => "referenceNumber"
        end

        def cost_code
          Print::Postage::CostCode.new @browser
        end

      end
      class CalculatePostageAmount < Print::Postage::PrintObject
        def weight
          Print::Postage::Weight.new @browser
        end

        def extra_services
          Print::Postage::ExtraServices.new @browser
        end
      end

      class SpecifyPostageAmount < Print::Postage::PrintObject
        def stamp_amount
          Print::Postage::StampAmount.new @browser
        end
      end

      class  SpecifyPostageService < Print::Postage::PrintObject
        def text_box
          StampsTextbox.new @browser.text_field :name => "nsService"
        end

        def drop_down
          StampsButton.new (@browser.divs :css => "div[class*=x-form-arrow-trigger]")[6]
        end

        def select selection
          log.info "Select Service #{selection}"
          box = text_box
          button = drop_down
          if selection == "Media Mail (2 - 3 Days)"
            selection_label = StampsLabel.new @browser.div :css => "div[data-qtip*='Media Mail (2 - 9 Days)']"
          else
            selection_label = StampsLabel.new @browser.div :css => "div[data-qtip*='#{selection}']"
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
              log.info "Selected Service #{selected_service} - #{(selected_service.include? selection)?"done": "service not selected"}"
              break if selected_service.include? selection
            rescue
              #ignore
            end
          }
          log.info "#{selection} service selected."
          selection_label
        end
      end

      def country
        Print::Postage::PostageCountry.new @browser
      end

      def serial
        StampsTextbox.new @browser.text_field :id => "sdc-mainpanel-nsserialtextfield-inputEl"
      end


      def calculate_postage_service
        Print::Postage::Service.new @browser
      end

      def specify_postage_service
        SpecifyPostageService.new @browser
      end

      def ship_from
        Print::Postage::ShipFrom.new @browser
      end

      def calculate_postage_amount
        checkbox = StampsCheckbox.new (@browser.input :id => "sdc-mainpanel-calculatepostageradio-inputEl"), (@browser.table :id => "sdc-mainpanel-calculatepostageradio"), "class", "checked"
        checkbox.check
        CalculatePostageAmount.new @browser
      end

      def specify_postage_amount
        checkbox = StampsCheckbox.new (@browser.input :id => "sdc-mainpanel-specifypostageradio-inputEl"), (@browser.table :id => "sdc-mainpanel-specifypostageradio"), "class", "checked"
        checkbox.check
        SpecifyPostageAmount.new @browser
      end

      def form_view
        Print::Postage::Stamps::StampsFormView.new @browser
      end

    end
  end
end
