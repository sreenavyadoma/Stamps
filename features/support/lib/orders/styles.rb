module Stamps
  module Orders
    class PageStyles < Browser::Modal
      def general
        General.new param
      end
    end

    class General < Browser::Modal

      class Links < Browser::Modal
        def color
          field = browser.link css: "a[rel=WebBatch]"
          browser_helper.wait_until_present field
          style = field.style "color"
          style
        end

        def padding

        end

        def background_color

        end
      end

      class NavigationHeader < Browser::Modal
        def height
          field = browser.div class: "navbar-inner"
          browser_helper.wait_until_present field
          field.style "height"
        end

        def background_color
          field = browser.div class: "navbar-inner"
          browser_helper.wait_until_present field
          style = field.style "background-color"
          style
        end
      end

      class Fonts < Browser::Modal
        def font_family
          browser.body.style "font-family"
        end

        def font_size
          browser.body.div.style "font-size"
        end

        def color
          body_color = browser.body.style "color"
          color_arr = body_color.scan /\d/
          temp = ""
          color_arr.each{|element| temp = temp + element}
          temp
        end
      end

      class Tooltip < Browser::Modal
        def width
          field = browser.link css: "a[data-qtip*='Configure your settings']"
          browser_helper.wait_until_present field
          field.style "border-width"
        end

        def border_radius
          field = browser.link css: "a[data-qtip*='Configure your settings']"
          browser_helper.wait_until_present field
          field.style "padding"
        end

        def border_style
          field = browser.link css: "a[data-qtip*='Configure your settings']"
          browser_helper.wait_until_present field
          field.style "border-style"
        end
      end

      def fonts
        Fonts.new param
      end

      def tooltip
        Tooltip.new param
      end

      def navigation_header
        @navigation_header = NavigationHeader.new param
      end

      def links
        @links = Links.new param
      end

    end
  end
end