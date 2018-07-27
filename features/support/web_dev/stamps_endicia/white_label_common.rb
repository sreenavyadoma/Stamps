module WhiteLabel

  class Common < SdcPage
    #stamps website
    page_object(:stamps_logo) {{id: 'sdc-logo'}}
    button(:get_started) { { class: ['btn btn-success btn-xs register'] } }

    #Print
    page_object(:print_stamps_logo) {{class: ['sdcLogo']}}

    #security questions
    page_object(:sq_header) {{xpath: '//h1[(contains(text(), "Before you start printing postage, make sure your account is protected."))]'}}
    page_object(:security_question) {{xpath: '//h2[(contains(text(), "To protect your account, please answer these security questions:"))]'}}
    page_objects(:first_security_question, index: 0) {{xpath: '//div[contains(@class, "secretQuestion")]/button'}}
    page_objects(:first_security_question_help_block,  index: 0) { {xpath: '//*[@id="secretquestions"]/div/div/div/span'} }
    text_field(:first_secret_answer, tag: :text_field, required: true) { { id: 'secretAnswer1' } }
    page_objects(:first_security_answer_help_block,  index: 0) { {xpath: '//*[@id="secretquestions"]/div/div/div/span'} }
    page_objects(:second_security_question, index: 1) {{xpath: '//div[contains(@class, "secretQuestion")]/button'}}
    page_objects(:second_security_question_help_block,  index: 0) { {xpath: '//*[@id="secretquestions"]/div/div/div/span'} }
    text_field(:second_secret_answer, tag: :text_field, required: true) { { id: 'secretAnswer2' } }
    page_objects(:second_security_answer_help_block,  index: 0) { {xpath: '//*[@id="secretquestions"]/div/div/div/span'} }
    button(:sq_get_started) { { id: 'startPrinting' } }

    #account created
    button(:account_created_continue) { {id: 'pawrContinue'} }

    def dropdown_selection(str, index, name = :dropdown_element)
      page_objects(name, index: index) { { xpath: "//span[contains(text(), \"#{str}\")]" } }
    end

    def source_id_query(source_id)
      if source_id.nil?
        source_id = WhiteLabel.sdc_db_connection.execute(
          "select TOP 1 *
          from [dbo].sdct_SW_Source as sw_source
          inner join [dbo].sdct_SW_Offer as sw_offer on sw_offer.OfferId = sw_source.OfferId
          ORDER BY NEWID()")
        source_id.each do |item|
          return item['SourceId'], item['Content'], item['PromoCode'], item['OfferId'], item['TargetUrl']
        end
      else
        source_id = WhiteLabel.sdc_db_connection.execute(
          "select *
          from [dbo].sdct_SW_Source as sw_source
          inner join [dbo].sdct_SW_Offer as sw_offer on sw_offer.OfferId = sw_source.OfferId
          where sw_source.SourceId = '#{source_id}'")
        source_id.each do |item|
          return item['SourceId'], item['Content'], item['PromoCode'], item['OfferId'], item['TargetUrl']
        end
      end
    end

    def username_query(username)
      username = WhiteLabel.bridge_db_connection.execute(
          "SELECT *
           FROM [Bridge].[dbo].[sdct_Bridge_User]
           where UserName = '#{username}'")
      username.each do |item|
        return item['UserName']
      end
    end

    def plan_query(offer_id, sku)
     data = WhiteLabel.stamp_mart_db_connection.execute(
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

  end

  class SDCWWebsite <SdcPage
    def self.visit(str)
      page_url { |env| "https://#{env}stamps.com/?source=#{str}" }
      super(case SdcEnv.env
              when :qacc
                'sdcwebsite.qacc.'
              when :stg
                'sdcwebsite.staging.'
              when :prod
                ''
              else
                # ignore
            end)
    end
  end

  class EWWebsite < SdcPage

    def self.visit
      page_url { |env| "https://#{env}endicia.com/" }
      super(case SdcEnv.env
              when :qacc
                'registration.qacc.'
              when :stg
                'registration.staging.'
              when :prod
                ''
              else
                # ignore
            end)
    end
  end

end