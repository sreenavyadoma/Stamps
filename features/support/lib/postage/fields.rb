module Postage

  class PostageObject < Stamps::Browser::BrowserObject
    def batch_helper
      PostageHelper.instance
    end
  end

  class PostageHelper
    include Singleton
    include DataMagic

  end
end