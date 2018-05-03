module SdcMail
  class PrintOn < SdcPage
    page_object(:text_field, tag: :text_field, required: :true, timeout: 30) { {xpath: ''} }
    page_object(:drop_down, required: :true, timeout: 30) { {xpath: ''} }
    page_object(:drop_down, required: :true, timeout: 30) { {xpath: '//*[text()="Manage Printing Options..."]'} }


    def upgrade_plan
      (cache[:upgrade_plan].nil? || !cache[:upgrade_plan].present?) ? cache[:upgrade_plan] = UpgradePlan.new(param) : cache[:upgrade_plan]
    end

    def manage_printing_options_lov
      (cache[:manage_printing_options_lov].nil? || !cache[:manage_printing_options_lov].present?) ? cache[:manage_printing_options_lov] = StampsField.new(
          driver.li(text: 'Manage Printing Options...')) : cache[:manage_printing_options_lov]
    end

    def manage_printing_options
      (cache[:manage_printing_options].nil? || !cache[:manage_printing_options].present?) ? cache[:manage_printing_options] = ManagePrintOptionsModal.new(param) : cache[:manage_printing_options]
    end

    def manage_printing_options_modal
      # Open Mange Print Options modal
      begin
        10.times do
          break if manage_printing_options.present?
          dropdown.click unless manage_printing_options_lov.present?
          manage_printing_options_lov.click
          sleep(0.25)
        end
        expect(manage_printing_options).to be_present, "Unable to open Manage Printing Options modal"
      end unless manage_printing_options.present?
      manage_printing_options
    end

    def show_all_print_media
      dropdown.click unless manage_printing_options_lov.present?
      5.times do
        break if driver.lis(css: "li[class*=x-boundlist-item]").size == 20
      end
      manage_printing_options_modal.show_all if driver.lis(css: "li[class*=x-boundlist-item]").size < 20
    end

    def select_print_on(str)
      dropdown.wait_until_present(4)
      dropdown.click
      10.times do
        begin
          if print_on_textbox.text.include?(PrintMediaHelper.selected_sub_str(str))
            dropdown.click if manage_printing_options_lov.present?
            return PrintMediaHelper.print_media(str)
          end
          selection = StampsField.new(driver.li(css: "li[class^=#{(data_for(:mail_print_media, {})[str]).split(',').first}][data-recordindex='#{(data_for(:mail_print_media, {})[str]).split(',').last}']"))
          dropdown.click unless manage_printing_options_lov.present?
          if selection.present?
            selection.scroll_into_view
            selection.click
          elsif manage_printing_options_lov.present? && !selection.present?
            show_all_print_media
          end
        rescue
          # ignore
        end
        sleep(0.15)
      end
      dropdown.click unless manage_printing_options_lov.present?
      nil
    end

    def tooltip(str)
      10.times do
        selection = StampsField.new(driver.div(text: str))
        dropdown.click unless selection.present?
        return selection.attribute_value "data-qtip" if selection.present?
      end
    end
  end
end