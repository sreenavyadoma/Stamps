module SdcMail

  class SdcUpgradePlan < SdcPage
    page_object(:window_title) { {xpath: ''} } # @window_title = StampsField.new(driver.div(text: "Upgrade Plan"))
    page_object(:upgrade_now) { {xpath: ''} }
    page_object(:x_btn) { {xpath: ''} }
    page_object(:not_yet) { {xpath: ''} }
    page_object(:paragraph) { {xpath: ''} }
  end

  class ManagePrintOptionsModal < WebApps::Base
    #include PrintMediaHelper



    def search_field
      (cache[:search_field].nil? || !cache[:search_field].present?) ? cache[:search_field] = StampsTextbox.new(
          driver.text_field(css: "[placeholder='Search']")) : cache[:search_field]
    end

    def save_button
      (cache[:save_button].nil? || !cache[:save_button].present?) ? cache[:save_button] = StampsField.new(
          driver.span(text: "Save")) : cache[:save_button]
    end

    def close_button
      (cache[:close_button].nil? || !cache[:close_button].present?) ? cache[:close_button] = StampsField.new(
          driver.img(class: "x-tool-img x-tool-close")) : cache[:close_button]
    end

    def present?
      search_field.present?
    end

    def wait_until_present(*args)
      search_field.wait_until_present(*args)
    end

    def show_all
      show(:stamps)
      show(:shipping_label_paper)
      show(:shipping_label_sdc1200)
      show(:shipping_label_5x8)
      show(:envelope_10)
      show(:envelope_9)
      show(:envelope_a9)
      show(:envelope_6)
      show(:envelope_a2)
      show(:envelope_7)
      show(:envelope_11)
      show(:envelope_12)
      show(:certified_mail_sdc3610)
      show(:certified_mail_sdc3710)
      show(:certified_mail_sdc3910)
      show(:certified_mail_sdc3930)
      show(:certified_mail_sdc3810)
      show(:certified_mail_sdc3830)
      show(:roll_4x6)
      show(:roll_418x614)
      save
    end

    def show(sym)
      case(sym)
      when :stamps
        search("Stamps").check
      when :shipping_label_paper
        search("Shipping Label - Paper").check
      when :shipping_label_sdc1200
        search("Shipping Label - SDC-1200").check
      when :shipping_label_5x8
        search("Shipping Label - 5x8").check
      when :envelope_9
        search("Envelope - 9").check
      when :envelope_10
        search("Envelope - 10").check
      when :envelope_a9
        search("Envelope - A9").check
      when :envelope_6
        search("Envelope - 6").check
      when :envelope_a2
        search("Envelope - A2").check
      when :envelope_7
        search("Envelope - 7").check
      when :envelope_11
        search("Envelope - 11").check
      when :envelope_12
        search("Envelope - 12").check
      when :certified_mail_sdc3610
        search("Certified Mail Label - SDC-3610").check
      when :certified_mail_sdc3710
        search("Certified Mail Label - SDC-3710").check
      when :certified_mail_sdc3910
        search("Certified Mail Label - SDC-3910").check
      when :certified_mail_sdc3930
        search("Certified Mail Label - SDC-3930").check
      when :certified_mail_sdc3810
        search("Certified Mail Label - SDC-3810").check
      when :certified_mail_sdc3830
        search("Certified Mail Label - SDC-3830").check
      when :roll_4x6
        search("Roll 4x6").check
      when :roll_418x614
        search("Roll 418x614").check
      else
        raise "Invalid print-on selection symbol: #{sym}"
      end
    end

    def search(str)
      search_field.set(PrintMediaHelper.mpo_search_str(str))
      30.times do
        sleep(0.05)
        break if driver.divs(css: "[class=x-grid-row-checker]").size == 1
      end
      search_result_count = driver.divs(css: "[class=x-grid-row-checker]").size
      expect(search_result_count).to eql(1), "Search Results yield more than 1. Got #{search_result_count}"

      clickable_field = driver.div(css: "[class=x-grid-row-checker]")
      verify = driver.div(css: "[class=x-grid-row-checker]").parent.parent.parent.parent.parent
      @search_result = Stamps::WebApps::StampsCheckbox.new(clickable_field, verify, "class", "selected")
    end

    def save
      save_button.click_while_present
      sleep(1)
      expect(save_button.present?).to be(false), "Failed to save Manage Print Options, modal might still be open. Check your test."
    end

    def close
      close_button.click_while_present
      sleep(1)
      expect(close_button.present?).to be(false), "Failed to close Manage Print Options, modal might still be open. Check your test."
    end
  end

  class SdcPrintOn < SdcPage
    page_object(:text_field, tag: :text_field, required: :true, timeout: 30) { {xpath: ''} }
    page_object(:drop_down, required: :true, timeout: 30) { {xpath: ''} }
    page_object(:manage_printing_options_lov, required: :true, timeout: 30) { {xpath: '//*[text()="Manage Printing Options..."]'} }


    def upgrade_plan
      SdcUpgradePlan.new
    end

    def manage_printing_options_lov
      (cache[:manage_printing_options_lov].nil? || !cache[:manage_printing_options_lov].present?) ? cache[:manage_printing_options_lov] = StampsField.new(
          driver.li(text: 'Manage Printing Options...')) : cache[:manage_printing_options_lov]
    end

    def manage_printing_options
      ManagePrintOptionsModal.new
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