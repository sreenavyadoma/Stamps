module Batch
  #require_relative '../common/stamps'
  include Stamps

  def self.url_prefix
    @url_prefix ||= data_for(:url_prefix, {})[ENV['URL']]
  end

  def self.order_id=(order_id)
    @order_id = order_id
    log "New Order ID:  #{order_id}"
  end

  def self.order_id
    @order_id
  end

end