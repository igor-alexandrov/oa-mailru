# coding: utf-8
module OmniAuth
  module Strategies
    class MailRuApi
      class ViewHelper
        module PageHelper
          def mailru_login_page
            mailru_header +
            mailru_login_button +
            mailru_footer
          end

          def mailru_header
<<-HEADER
  <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
  <html xmlns="http://www.w3.org/1999/xhtml"> 
  <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Вход в Mail.RU</title>
  </head> 
  <body>
HEADER
          end
          
          def mailru_login_button(control = nil)
            control = "<div id=\"mailru_login\" style=\"margin: 0 auto 20px auto;\" onclick=\"mailruLogin.Login();\"></div>" unless control.present?
<<-BUTTON
<div id="mailru_api_transport"></div>
<script type="text/javascript">
  mailru.loader.require('api', function() {
      mailru.connect.init('#{OmniAuth.config.mailru_app_id}', '#{OmniAuth.config.mailru_private_key}');
      mailru.events.listen(mailru.connect.events.login, function(session){
              mailru.common.users.getInfo(function(result){
                mailruLogin.redirectWithPost('#{OmniAuth.config.path_prefix}/mailru/callback', result[0]);
              });
      });
  });

  mailruLogin = {
    Login: function() {
      window.open('http://connect.mail.ru/connect?app_id=#{OmniAuth.config.mailru_app_id}&host=http://' + window.location.host, '', 'width=550, height=510');
      return false;
    },
    redirectWithPost: function(url, data) {
      data = data || {};
      #{ respond_to?(:request_forgery_protection_token) && respond_to?(:form_authenticity_token) ?
      "data['#{request_forgery_protection_token}'] = '#{form_authenticity_token}'; var method = 'POST';" :
      "var method = 'GET';" }
      var form = document.createElement("form"),
          input;
      form.setAttribute("action", url);
      form.setAttribute("method", method);
  
      for (var property in data) {
        if (data.hasOwnProperty(property)) {
          var value = data[property];
          if (value instanceof Array) {
            for (var i = 0, l = value.length; i < l; i++) {
              input = document.createElement("input");
              input.setAttribute("type", "hidden");
              input.setAttribute("name", property);
              input.setAttribute("value", value[i]);
              form.appendChild(input);
            }
          }
          else {
            input = document.createElement("input");
            input.setAttribute("type", "hidden");
            input.setAttribute("name", property);
            input.setAttribute("value", value);
            form.appendChild(input);
          }
        }
      }
      document.body.appendChild(form);
      form.submit();
      document.body.removeChild(form);
    }
  };
  (function() {
    var el = document.createElement("script");
    el.type = "text/javascript";
    el.charset = "windows-1251";
    el.src = "http://cdn.connect.mail.ru/js/loader.js";
    el.async = true;
    document.getElementById("mailru_api_transport").appendChild(el);
  }());
</script>
#{control}
BUTTON
          end

          def mailru_footer
<<-FOOTER
  </body></html>
FOOTER
          end
        end
      end
    end
  end
end
