module Batch
  class CustomsItem < BrowserObject

    def description
      text_box = TextBox.new(@browser.text_field :name => "CustomsItemName")
      log "CustomsItemName present? #{browser_helper.present? text_box}"
      text_box
    end

    def qty
      text_box = TextBox.new(@browser.text_field :name => "CustomsItemQuantity")
      log "CustomsItemQuantity present? #{browser_helper.present? text_box}"
      text_box
    end

    def qty_increment value

    end

    def qty_decrement value

    end

    def unit_price
      text_box = TextBox.new(@browser.text_field :name => "CustomsItemPrice")
      log "CustomsItemPrice present? #{browser_helper.present? text_box}"
      text_box
    end

    def unit_price_increment value

    end

    def unit_price_decrement value

    end

    def lbs
      text_box = TextBox.new(@browser.text_field :name => "CustomsItemWeightLb")
      log "CustomsItemWeightLb present? #{browser_helper.present? text_box}"
      text_box
    end

    def lbs_increment value

    end

    def lbs_decrement value

    end

    def oz
      text_box = TextBox.new(@browser.text_field :name => "CustomsItemWeightOz")
      log "CustomsItemWeightOz present? #{browser_helper.present? text_box}"
      text_box
    end

    def oz_increment value

    end

    def oz_decrement value

    end

    def origin_dd
      drop_down = (@browser.divs :css => "div[id^=combobox-][id$=-trigger-picker]").last
      raise "Drop-down button is not present.  Check your CSS locator." unless browser_helper.present? drop_down
      input = (@browser.text_field :name => "OriginCountry").last
      raise "Drop-down button is not present.  Check your CSS locator." unless browser_helper.present? input
      DropDown.new @browser, drop_down, "li", input
    end

    def hs_tariff
      text_box = TextBox.new(@browser.text_field :name => "HSTariff")
      log "HSTariff present? #{browser_helper.present? text_box}"
      text_box
    end

  end
end