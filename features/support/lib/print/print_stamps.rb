# encoding: utf-8
module Stamps
  module Print
    module Postage
      class NetStamps < Print::Postage::PrintPostageObject

        class StampsFormView < Print::Postage::PrintPostageObject

          def preview_image serial_prefix
            case serial_prefix

              when 'A'
                image = BrowserElement.new browser.div css: "div[style*='traditional-bk.gif']"
              when 'B'
                image = BrowserElement.new browser.div css: "div[style*='bseries-bk.gif']"
              when 'C'
                image = BrowserElement.new browser.div css: "div[style*='standard-bk.gif']"
              when 'K'
                image = BrowserElement.new browser.div css: "div[style*='themed-bk.gif']"
              when 'M'
                image = BrowserElement.new browser.div css: "div[style*='landscape-bk.gif']"
              when 'P'
                image = BrowserElement.new browser.div css: "div[style*='portrait-bk.gif']"
              when 'R'
                image = BrowserElement.new browser.div css: "div[style*='return-bk.gif']"
              when 'V'
                image = BrowserElement.new browser.div css: "div[style*='standard-bk.gif']"
              when 'W'
                image = BrowserElement.new browser.div css: "div[style*='PromoPaper20-bk.gif']"
              when 'L'
                image = BrowserElement.new browser.div css: "div[style*='landscape-bk.gif']"
              when 'S'
                image = BrowserElement.new browser.div css: "div[style*='sordSeries-bk.gif']"
              else
                logger.info "Invalid Serial Number #{serial_prefix}"
                image = BrowserElement.new browser.div css: "div[style*='traditional-bk.gif']"
            end

          end

          def quantity
            Print::Postage::Quantity.new param
          end

          def print_all
            checkbox_field = browser.text_field css: "input[class*=sdc-previewpanel-printallcheckbox]"
            verify_fields = browser.inputs css: "table[id^=checkboxfield][class*=x-form-type-checkbox]"
            verify_field = verify_fields[8]

            Stamps::Browser::BrowserCheckbox.new checkbox_field, verify_field, "class", "checked"
          end

          def reference_number
            BrowserTextBox.new browser.text_field name: "referenceNumber"
          end

          def cost_code
            Print::Postage::CostCode.new param
          end

        end

        class CalculatePostageAmount < Browser::Modal
          def weight
            Print::Postage::Weight.new param
          end

          def extra_services
            Print::Postage::ExtraServices.new param
          end
        end

        class SpecifyPostageAmount < Browser::Modal
          def stamp_amount
            Print::Postage::StampAmount.new param
          end
        end

        class  SpecifyPostageService < Browser::Modal
          def text_box
            BrowserTextBox.new browser.text_field name: "nsService"
          end

          def drop_down
            BrowserElement.new (browser.divs css: "div[class*=x-form-arrow-trigger]")[6]
          end

          def select selection
            logger.info "Select Service #{selection}"
            box = text_box
            button = drop_down
            if selection == "Media Mail (2 - 3 Days)"
              selection_label = BrowserElement.new browser.div css: "div[data-qtip*='Media Mail (2 - 9 Days)']"
            else
              selection_label = BrowserElement.new browser.div css: "div[data-qtip*='#{selection}']"
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

        def serial
          BrowserTextBox.new browser.text_field id: "sdc-mainpanel-nsserialtextfield-inputEl"
        end

        def calculate_postage_service
          Print::Postage::Service.new param
        end

        def specify_postage_service
          SpecifyPostageService.new param
        end

        def calculate_postage_amount
          checkbox = BrowserCheckbox.new (browser.text_field id: "sdc-mainpanel-calculatepostageradio-inputEl"), (browser.table id: "sdc-mainpanel-calculatepostageradio"), "class", "checked"
          checkbox.check
          CalculatePostageAmount.new param
        end

        def specify_postage_amount
          checkbox = BrowserCheckbox.new (browser.text_field id: "sdc-mainpanel-specifypostageradio-inputEl"), (browser.table id: "sdc-mainpanel-specifypostageradio"), "class", "checked"
          checkbox.check
          SpecifyPostageAmount.new param
        end

        def form_view
          Print::Postage::Stamps::StampsFormView.new param
        end

      end
    end
  end
end
