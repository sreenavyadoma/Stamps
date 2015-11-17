module Postage

  class PostageObject < Stamps::Browser::BrowserObject
  end

  class PostageHelper
    include Singleton
    include DataMagic

  end
end