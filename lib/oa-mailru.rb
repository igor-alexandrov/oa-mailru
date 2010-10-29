require 'omniauth/mailru'
if defined?(Rails)
  ActionController::Base.helper OmniAuth::Strategies::MailRuApi::ViewHelper::PageHelper
end
