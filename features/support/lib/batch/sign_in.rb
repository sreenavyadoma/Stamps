module Batch

  class WelcomeModal < BatchObject
    private
    def okay_button
      @browser.span :text => 'OK'
    end

    public
    def present?
      browser_helper.present? okay_button
    end

    def wait_until_present
      begin
        okay_button.wait_until_present
      rescue
        #ignore
      end
    end

    def ok
      5.times{
        browser_helper.click okay_button, 'OK'
        break unless browser_helper.present? okay_button
      }
    end
  end

  class WelcomeOrdersPage < BatchObject
    private
    def continue_span
      @browser.span :text => "Continue"
    end

    public
    def present?
      browser_helper.present? continue_span
    end

    def wait_until_present
      begin
        continue_span.wait_until_present
      rescue
        #ignore
      end
    end

    def continue
      5.times{
        if browser_helper.present? continue_span
          browser_helper.click continue_span, 'continue'
        end
        break unless browser_helper.present? continue_span
      }
    end
  end

  class SignInPage < BatchObject
    private
    LOGIN_FIELDS ||= {
        :sign_in_link_loc => {:id => 'signInButton'},
        :username_loc => {:id => 'UserNameTextBox'},
        :password_loc => {:id => 'PasswordTextBox'},
        :sign_in_button_loc => {:id => 'signInButton'}
    }

    public
    def page_title
      @browser.title
    end

    def verify_page
      page_title
    end

    def visit *args
      if args.length == 1
        ENV['URL'] = args[0]
      end

      if ENV['URL'] == "ss"
        url = "http://#{Stamps::Test.url_prefix}.stamps.com/webbatch/"
      else
        url = "https://#{Stamps::Test.url_prefix}.stamps.com/webbatch/"
      end

      #url = "https://#{Stamps::Test.url_prefix}.stamps.com/webbatch/"
      @browser.goto url
      log.info "Page loaded.  #{url}"
      self
    end

    def sign_in *args
      case args
        when Hash
          username = args['username']
          password = args['password']
        when Array
          if args.length == 2
            username = args[0]
            password = args[1]
          else
            log.info "Using Default Sign-in Credentials: #{ENV["USR"]}/#{ENV["PW"]}"
            username = ENV["USR"]
            password = ENV["PW"]
          end
        else
          log.info "Using Default Sign-in Credentials: #{ENV["USR"]}/#{ENV["PW"]}"
          username = ENV["USR"]
          password = ENV["PW"]
      end

      username_textbox = Textbox.new @browser.text_field(LOGIN_FIELDS[:username_loc])
      password_textbox = Textbox.new @browser.text_field(LOGIN_FIELDS[:password_loc])
      sign_in = Button.new @browser.input :id => "signInButton"
      grid = Grid.new @browser
      navigation = Navigation.new @browser
      welcome_modal = WelcomeModal.new @browser
      welcome_orders_page = WelcomeOrdersPage.new @browser
      plugin_issue = ErrorStampsPluginIssue.new @browser
      toolbar = Toolbar.new @browser

      20.times do
        begin
          log.info "#{username} is #{(toolbar.present?)?"signed-in!":"not signed-in."}"
          break if toolbar.present? #|| grid.present?
          if username_textbox.present?
            username_textbox.wait_until_present
            username_textbox.set username
            password_textbox.set password
            sleep 1
            begin
              sign_in.send_keys :enter
            rescue
              #ignore
            end
            sleep 6
            log.info "#{username} is #{(navigation.is_signed_in?)?"signed-in!":"not signed-in."}"
            log.info "#{username} Order Grid is #{(toolbar.present?)?"ready.":"not ready."}"

            begin
              sign_in.send_keys :enter
            rescue
              #ignore
            end

            log.info "#{username} is #{(navigation.is_signed_in?)?"signed-in!":"not signed-in."}"
            log.info "#{username} Order Grid is #{(toolbar.present?)?"ready.":"not ready."}"

            sleep 6

            toolbar.wait_until_present

            log.info "#{username} is #{(navigation.is_signed_in?)?"signed-in!":"not signed-in."}"
            log.info "#{username} Order Grid is #{(toolbar.present?)?"ready.":"not ready."}"
            break if toolbar.present? #|| grid.present?
            log.info "#{username} is #{(navigation.is_signed_in?)?"signed-in!":"not signed-in."}"
            log.info "#{username} Order Grid is #{(toolbar.present?)?"ready.":"not ready."}"

            if welcome_modal.present?
              welcome_modal.ok
              break
            end

            log.info "#{username} is #{(navigation.is_signed_in?)?"signed-in!":"not signed-in."}"
            log.info "#{username} Order Grid is #{(toolbar.present?)?"ready.":"not ready."}"
            if welcome_orders_page.present?
              welcome_orders_page.continue
              break
            end

            log.info "#{username} is #{(navigation.is_signed_in?)?"signed-in!":"not signed-in."}"
            log.info "#{username} Order Grid is #{(toolbar.present?)?"ready.":"not ready."}"
            break if toolbar.present?
            log.info "#{username} is #{(navigation.is_signed_in?)?"signed-in!":"not signed-in."}"
            log.info "#{username} Order Grid is #{(toolbar.present?)?"ready.":"not ready."}"

            if plugin_issue.present?
              plugin_issue.close
              break
            end
          else
            visit
          end

          log.info "#{username} is #{(navigation.is_signed_in?)?"signed-in!":"not signed-in."}"
          log.info "#{username} Order Grid is #{(toolbar.present?)?"ready.":"not ready."}"
          break if toolbar.present? #|| grid.present?

          log.info "#{username} is #{(navigation.is_signed_in?)?"signed-in!":"not signed-in."}"
          log.info "#{username} Order Grid is #{(toolbar.present?)?"ready.":"not ready."}"
          begin
            navigation.orders.click
          rescue
            #ignore
          end

          sleep 4
          log.info "#{username} is #{(navigation.is_signed_in?)?"signed-in!":"not signed-in."}"
          log.info "#{username} Order Grid is #{(toolbar.present?)?"ready.":"not ready."}"
          break if toolbar.present? #|| grid.present?

          log.info "#{username} is #{(navigation.is_signed_in?)?"signed-in!":"not signed-in."}"
          log.info "#{username} is #{(toolbar.present?)?"signed-in!":"not signed-in."}"
          visit
        rescue Exception => e
          log.info e
        end
      end

      log.info "#{username} is #{(toolbar.present?)?"signed-in!":"not signed-in."}"

      if plugin_issue.present?
        raise "Stamps.com Plugin Issue"
      end

      ENV["SIGNED_IN_USER"] = username

    end
  end

end