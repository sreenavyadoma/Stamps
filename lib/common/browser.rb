module Stamps
  class Browser
    include Singleton

    def chrome?
      "chrome|gc|google".include? ENV['BROWSER'].downcase
    end

    def explorer?
      "ie|explorer|internet explorer".include? ENV['BROWSER'].downcase
    end

    def firefox?
      "ie|explorer|internet explorer".include? ENV['BROWSER'].downcase
    end
  end
end