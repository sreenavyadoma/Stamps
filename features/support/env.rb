$LOAD_PATH << File.expand_path('../../lib', __FILE__)
$LOAD_PATH << File.expand_path('../../lib/web_batch', __FILE__)

require 'data_magic'
#require 'singleton'
require 'watir-webdriver'
module Watir
  module Container
    def g(*args)
      G.new(self, extract_selector(args).merge(:tag_name => "g"))
    end

    def gs(*args)
      GCollection.new(self, extract_selector(args).merge(:tag_name => "g"))
    end
  end

  class G < Element
    def cursor_style()
      assert_exists
      return @element.style("cursor")
    end
  end

  class GCollection < ElementCollection
    def element_class
      G
    end
  end

end

require 'log4r'
require 'rspec'

require_relative '../../lib/web_batch/web_batch'
#require_relative '../../lib/common/stamps'

World(Batch)
