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

  class LoginPage < BatchObject
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
    def load_url
      url = "https://#{Batch.url_prefix}.stamps.com/webbatch/"
      @browser.goto url
      log "Page reloaded.  #{url}"
    end

    def sign_in *args
      username_textbox = Textbox.new @browser.text_field(LOGIN_FIELDS[:username_loc])
      password_textbox = Textbox.new @browser.text_field(LOGIN_FIELDS[:password_loc])
      sign_in_input = Button.new @browser.input :id => "signInButton"
      grid = Grid.new @browser
      navigation = Navigation.new @browser
      welcome_modal = WelcomeModal.new @browser
      welcome_orders_page = WelcomeOrdersPage.new @browser
      plugin_issue = ErrorStampsPluginIssue.new @browser
      toolbar = Toolbar.new @browser

      case args[0]
        when Hash
          username = args[0]['username']
          password = args[0]['password']
        when Array
          if args[0].length == 2
            username = args[0][0]
            password = args[0][1]
          else
            log "Using Default Sign-in Credentials: #{ENV["USR"]}/#{ENV["PW"]}"
            username = ENV["USR"]
            password = ENV["PW"]
          end
        else
          log "Using Default Sign-in Credentials: #{ENV["USR"]}/#{ENV["PW"]}"
          username = ENV["USR"]
          password = ENV["PW"]
      end

      30.times do
        begin
          break if toolbar.present? #|| grid.present?
          if username_textbox.present?
            username_textbox.wait_until_present
            username_textbox.set username
            password_textbox.set password

            begin
              (@browser.input :id => "signInButton").send_keys :enter
            rescue
              #ignore
            end
            sign_in_input.safe_click

            #sign_in_button.click_while_present

            toolbar.wait_until_present
            break if toolbar.present? #|| grid.present?

            if welcome_modal.present?
              welcome_modal.ok
              break
            end

            if welcome_orders_page.present?
              welcome_orders_page.continue
              break
            end

            if plugin_issue.present?
              plugin_issue.close
              break
            end
          end

          break if toolbar.present? #|| grid.present?

          begin
            navigation.orders.click
          rescue
            #ignore
          end

          sleep 1
          break if toolbar.present? #|| grid.present?

          load_url
        rescue Exception => e
          log e
        end
      end

      if plugin_issue.present?
        raise "Stamps.com Plugin Issue"
      end

    end
  end

end