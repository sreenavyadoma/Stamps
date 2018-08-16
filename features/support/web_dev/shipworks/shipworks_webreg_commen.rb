module SWWR

  class Common < SdcPage
    #Shipworks website
    page_object(:shipworks_logo) {{class: ['logo-wrap']}}
    page_objects(:try_it_free) { { class: ['register dtm'] } }

    #Breadcrumb
    page_objects(:create_account_breadcrumb) { { xpath: '//span[@class="breadcrumb-text"]' } }

    def dropdown_selection(str, index, name = :dropdown_element)
      page_objects(name, index: index) { { xpath: "//span[contains(text(), \"#{str}\")]" } }
    end

    def sww_website_source_id_query(offer_id)
      if offer_id.nil?
        source_id = SWWR.sww_db_connection.execute(
            "select TOP 1 *
             from [dbo].[sdct_SWW_Source]  as sww_source
             inner join [dbo].[sdct_SWW_Offer] as sww_offer on sww_offer.OfferId = sww_source.OfferId
             ORDER BY NEWID()")
        source_id.each do |item|
          return item['SourceId'], item['PromoCode'], item['OfferId'], item['TargetUrl']
        end
      else
        source_id = SWWR.sww_db_connection.execute(
            "select TOP 1 *
             from [dbo].[sdct_SWW_Source]  as sww_source
             inner join [dbo].[sdct_SWW_Offer] as sww_offer on sww_offer.OfferId = sww_source.OfferId
             where sww_offer.OfferId = #{offer_id}
             ORDER BY NEWID()")
        source_id.each do |item|
          return item['SourceId'], item['PromoCode'], item['OfferId'], item['TargetUrl']
        end
      end
    end

    def stamps_mart_source_id_query(source_id)
      source_id = SWWR.stamp_mart_db_connection.execute(
          "select * FROM [Stampmart].[dbo].[smt_PromotionOffers]
       where PromoCode = '#{source_id}'")
      source_id.each do |item|
        return item['OfferID'], item['PromoCode']
      end
    end

    def username_query(username)
      username = SWWR.bridge_db_connection.execute(
          "SELECT *
           FROM [Bridge].[dbo].[sdct_Bridge_User]
           where UserName = '#{username}'")
      username.each do |item|
        return item['UserName']
      end
    end

    def existing_username_query
      username = SWWR.bridge_db_connection.execute(
          "select TOP 1 *
          FROM [Bridge].[dbo].[sdct_Bridge_User]
          where EmailAddress IS NOT NULL and UserName NOT like '%\\%'
          ORDER BY NEWID()")
      username.each do |item|
        return item['UserName']
      end
    end

    def plan_query(offer_id, sku)
      data = SWWR.stamp_mart_db_connection.execute(
          "select  offer_pricing_plans.OfferID, offer_pricing_plans.PlanID, pricing_plans.SKU, pricing_plans.MonthlyBaseFee
       from [dbo].[smt_pricingplans] as pricing_plans
       inner join  [dbo].[smt_OfferPricingPlans] as offer_pricing_plans on  offer_pricing_plans.PlanID = pricing_plans.PlanID
       where offer_pricing_plans.OfferID = #{offer_id} and pricing_plans.SKU = #{sku}")

      data.each do |item|
        return item['MonthlyBaseFee']
      end
    end

    def plan_sku
      SdcPage.browser.execute_script('return WR.model.session.reg.planSku')
    end

    def wr_model_session_offer
      SdcPage.browser.execute_script('return WR.model.session.offer')
    end

  end

  class SwwWebsite <SdcPage
    def self.visit(str)
      page_url { |env| "https://#{env}shipworks.com/?source=#{str}&mboxDisable=1" }
      super(case TestSession.env.url
              when :qacc
                'shipworkswebsite.qacc.'
              when :stg
                'shipworkswebsite.staging.'
              when :prod
                ''
              else
                # ignore
            end)
    end
  end

end