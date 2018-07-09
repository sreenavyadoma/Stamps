module WhiteLabel
  class ProfilePage

  end

  class << self

    def profile_page
      ProfilePage.new
    end
    def common_page
      Common.new
    end

    def sdcw_website
      SDCWWebsite.new
    end

    def ew_website
      EWWebsite.new
    end

  end

end