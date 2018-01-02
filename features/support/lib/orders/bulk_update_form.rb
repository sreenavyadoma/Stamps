module Stamps
  module Orders
    module MultiOrderDetails
      module Toolbar
      end

      module PresetMenu
      end

      module Body
        class Dimensions < Browser::Base
          def present?
            length.present? && width.present? && height.present?
          end

          def length
            (cache[:length].nil?||!cache[:length].present?)?cache[:length]=StampsNumberField.new(
                browser.text_field(css: "[class*=mult] [name=Length]"),
                browser.div(css: "[class*=mult] [id^=dim][id$=El] [class*=target]>div:nth-child(1) [class*=up]"),
                browser.div(css: "[class*=mult] [id^=dim][id$=El] [class*=target]>div:nth-child(1) [class*=down]")):cache[:length]
          end

          def width
            (cache[:width].nil?||!cache[:width].present?)?cache[:width]=StampsNumberField.new(
                browser.text_field(css: "[class*=mult] [name=Width]"),
                browser.div(css: "[class*=mult] [id^=dim][id$=El] [class*=target]>div:nth-child(3) [class*=up]"),
                browser.div(css: "[class*=mult] [id^=dim][id$=El] [class*=target]>div:nth-child(3) [class*=down]")):cache[:width]
          end

          def height
            (cache[:height].nil?||!cache[:height].present?)?cache[:height]=StampsNumberField.new(
                browser.text_field(css: '[class*=mult] [name=Height]'),
                browser.div(css: "[class*=mult] [id^=dim][id$=El] [class*=target]>div:nth-child(5) [class*=up]"),
                browser.div(css: "[class*=mult] [id^=dim][id$=El] [class*=target]>div:nth-child(5) [class*=down]")):cache[:height]
          end

          def checkbox

          end
        end


        class Weight < Browser::Base
          def pounds
            (cache[:pounds].nil?||!cache[:pounds].present?)?cache[:pounds]=StampsNumberField.new(
                browser.text_field(css: "[class*=mult] [name=WeightLbs]"),
                browser.div(css: "[class*=mult] [class*=pounds] [class*=up]"),
                browser.div(css: "[class*=mult] [class*=pounds] [class*=down]")):cache[:length]
          end

          def ounces
            (cache[:ounces].nil?||!cache[:ounces].present?)?cache[:ounces]=StampsNumberField.new(
                browser.text_field(css: "[class*=mult] [name=WeightOz]"),
                browser.div(css: "[class*=mult] [class*=ounces] [class*=up]"),
                browser.div(css: "[class*=mult] [class*=ounces] [class*=down]")):cache[:width]
          end

          def present?
            length.present? && width.present? && height.present?
          end
        end

        class InsureForField < Browser::Base
          attr_reader :textbox, :increment_trigger, :decrement_trigger, :blur_field, :dropdown
          def initialize(param)
            super(param)
            @textbox=StampsTextbox.new browser.text_field(css: "div[id^=multiOrderDetailsForm]>div>div>div>div>div>div>div>div>div>[id^=combo-][id$=-inputEl]")
            @dropdown=StampsField.new browser.div(css: "div[id^=multiOrderDetailsForm][id$=targetEl]>div:nth-child(7)>div>div>div>div[id^=combo-][id$=bodyEl]>div>div[id$=picker]")
            @decrement_trigger=StampsField.new browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id*=spinner]>div[class*=down]")
            @increment_trigger=StampsField.new browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id*=spinner]>div[class*=up]")
          end

          def text
            textbox.text
          end

          def value
            return text.to_f if checked?
            0
          end

          def set(value)
            15.times do
              check
              textbox.set(value)
              sleep(0.25)
              3.times {blur_out}
              return true if text.to_f==value.to_f
            end
            expect(text.to_f).to eql(value.to_f)
          end

          def increment(value)
            value.to_i.times do
              increment_trigger.click
            end
          end

          def decrement(value)
            value.to_i.times do
              decrement_trigger.click
            end
          end
        end

        class MultiOrderDetailsTracking < Browser::Base
          attr_reader :textbox, :dropdown
          def initialize(param)
            super(param)
            @textbox=StampsTextbox.new browser.text_field(name: 'Tracking')
            @dropdown=StampsField.new browser.div(css: "div[id^=multiOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=trackingdroplist-][id$=trigger-picker]")
          end

          def present?
            textbox.present?
          end

          def tracking_selection(selection)
            if selection.downcase.include? "usps"
              browser.tds(css: "div[id=sdc-trackingdroplist-dc]>table>tbody>tr>td")
            elsif selection.downcase.include? "signature"
              browser.tds(css: "div[id=sdc-trackingdroplist-sc]>table>tbody>tr>td")
            elsif selection.downcase.include? "none"
              browser.tds(css: "div[id=sdc-trackingdroplist-none]>table>tbody>tr>td")
            else
              expect("#{selection} is not a valid selection").to eql "Valid selections are USPS Tracking and Signature Required"
            end
          end

          # todo-rob Details Tracking selection fix
          def select(str)
            expect(dropdown).to be_present
            20.times do
              selection=StampsField.new(tracking_selection(str).first)
              dropdown.click unless selection.present?
              selection.click
              break if textbox.text.include?(str)
            end
            expect(textbox.text).to include(str)
          end

          def tooltip(selection)
            selection_label=browser.td(text: selection)
            5.times {
              begin
                dropdown.click unless selection_label.present?
                if selection_label.present?
                  qtip=selection_label.parent.parent.parent.parent.attribute_value("data-qtip")
                  logger.info "#{qtip}"
                  return qtip
                end
              rescue
                #ignore
              end
            }
          end
        end

        class MultiUpdateController < Browser::Base
          attr_reader :update_orders_btn, :save_as_present_btn, :updating_orders

          def initialize(param)
            super(param)
            @update_orders_btn=StampsField.new browser.span(text: 'Update Orders')
            @save_as_present_btn=StampsField.new browser.span(text: 'Save as Preset')
            @updating_orders=StampsField.new(browser.div(text: "Updating Orders"))
          end

          def present?
            update_orders_btn.present?
          end

          def update_orders
            update_orders_btn.click
            sleep(2)
            updating_orders.wait_while_present(5)
            #expect(updating_orders).to be_present
          end

          def save_as_present
            5.times do
              return view_restrictions if view_restrictions.present?
              restrictions_btn.click
            end
          end
        end

        class PoundsField < Browser::Base
          def present?
            textbox.present?
          end

          def textbox
            StampsTextbox.new(browser.text_field(css: "[class*=multiorder-detailsform] [name=WeightLbs]"))
          end

          def spinner_up
            StampsField.new(browser.div(css: "[class*=multiorder-detailsform] [class*=pounds-numberfield] [class*=spinner-up]"))
          end

          def spinner_down
            StampsField.new(browser.div(css: "[class*=multiorder-detailsform] [class*=pounds-numberfield] [class*=spinner-down]"))
          end
        end

        class OuncesField < Browser::Base
          def present?
            textbox.present?
          end

          def textbox
            (@textbox.nil?||!textbox.present?)?@textbox=StampsTextbox.new(browser.text_field(css: "[class*=multiorder-detailsform] [name=WeightOz]")):@textbox
          end

          def spinner_up
            (@spinner_up.nil?||!textbox.present?)?@spinner_up=StampsField.new(browser.div(css: "[class*=multiorder-detailsform] [class*=ounces-numberfield] [class*=spinner-up]")):@spinner_up

          end

          def spinner_down
            (@spinner_down.nil?||!textbox.present?)?@spinner_down=StampsField.new(browser.div(css: "[class*=multiorder-detailsform] [class*=ounces-numberfield] [class*=spinner-down]")):@spinner_down
          end
        end

        class WeightField < Browser::Base

          def checkbox
            StampsCheckbox.new(
                browser.input(css: "[class*=multiorder-detailsform] [class*=weight-row]>div>div>[class*=x-form-type-checkbox] input"),
                browser.div(css: "[class*=multiorder-detailsform] [class*=weight-row]>div>div>[class*=x-form-type-checkbox]"),
                "class", "checked")
          end

          def pounds
            PoundsField.new(param)
          end

          def ounces
            OuncesField.new(param)
          end

          def weigh
            StampsField.new(browser.a(css: "[class*=multiorder-detailsform] [class*=scale-btn]"))
          end
        end

        class DomesticServiceField < Browser::Base

        end

        module Fields
          def ship_from
            @multi_ship_from=Stamps::Orders::DetailsFormCommon::DetailsFormShipFrom.new(param, :multi_order_details)
          end

          def weight
            (cache[:weight].nil?||!cache[:weight].present?)?cache[:weight]=::WeightField.new(param):cache[:weight]
          end

          def domestic_service
            @multi_dom_service=Stamps::Orders::DetailsFormCommon::DetailsFormService.new(param, :multi_order_dom)
          end

          def international_service
            @multi_int_service=Stamps::Orders::DetailsFormCommon::DetailsFormService.new(param, :multi_order_int)
          end

          def dimensions
            (cache[:length].nil?||!cache[:length].present?)?cache[:length]=Dimensions.new(param):cache[:length]
          end
        end
      end

      class BulkUpdate < Browser::Base
        include Toolbar
        include PresetMenu
        include Body::Fields

        def buttons
          @buttons=MultiUpdateController.new(param)
          #(cache[:multi_order].nil?||!cache[:multi_order].present?)?cache[:multi_order]=Orders::MultiOrderDetails::BulkUpdateForm.new(param):cache[:multi_order]
        end

        def blur_out_field
          (cache[:blur_out].nil?||!cache[:blur_out].present?)?cache[:blur_out]=StampsField.new(browser.label(text: "Bulk Update:")):cache[:blur_out]
        end

        def blur_out(count=1)
          ((count.nil?)?1:count.to_i).times do
            blur_out_field.double_click
            blur_out_field.flash
            blur_out_field.click
          end
        end

        def present?
          blur_out_field.present?
        end
      end
    end
  end
end



