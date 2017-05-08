module Stamps
  module Orders
    class PageStyles < Browser::StampsModal
      def general
        General.new(param)
      end
    end

    class General < Browser::StampsModal

      class Links < Browser::StampsModal
        def color
          field = browser.link css: "a[rel=WebBatch]"
          field.wait_until_present 6
          style = field.style "color"
          style
        end

        def padding

        end

        def background_color

        end
      end

      class NavigationHeader < Browser::StampsModal
        def height
          field = browser.div class: "navbar-inner"
          field.wait_until_present 5
          field.style "height"
        end

        def background_color
          field = browser.div class: "navbar-inner"
          field.wait_until_present 5
          style = field.style "background-color"
          style
        end
      end

      class Fonts < Browser::StampsModal
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

      class Tooltip < Browser::StampsModal
        def width
          field = browser.link css: "a[data-qtip*='Configure your settings']"
          field.wait_until_present 6
          field.style "border-width"
        end

        def border_radius
          field = browser.link css: "a[data-qtip*='Configure your settings']"
          field.wait_until_present 5
          field.style "padding"
        end

        def border_style
          field = browser.link css: "a[data-qtip*='Configure your settings']"
          field.wait_until_present 5
          field.style "border-style"
        end
      end

      def fonts
        Fonts.new(param)
      end

      def tooltip
        Tooltip.new(param)
      end

      def navigation_header
        @navigation_header = NavigationHeader.new(param)
      end

      def links
        @links = Links.new(param)
      end
    end
  end
end