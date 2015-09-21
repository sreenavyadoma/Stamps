module Batch

  class PageStyles < BatchObject
    def general
      @general ||= General.new @browser
    end
  end

  class General < BatchObject
    def font_family
      @browser.body.style "font-family"
    end

    def font_size
      @browser.body.div.style "font-size"
    end

    def color
      body_color = @browser.body.style "color"
      color_arr = body_color.scan /\d/
      temp = ""
      color_arr.each{|element| temp = temp + element}
      temp
    end

  end
end