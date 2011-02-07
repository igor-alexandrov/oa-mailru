require 'omniauth/mailru'
require 'omniauth/strategies/mailru_api/view_helper'

module OmniAuth
  class Configuration
    attr_accessor :mailru_app_id, :mailru_private_key
  end
end

module OmniAuth
  module Strategies
    class MailRuApi
      include OmniAuth::Strategy
      include ViewHelper::PageHelper

      def initialize(app, app_id, app_private_key, options = {})
        OmniAuth.config.mailru_app_id = app_id
        OmniAuth.config.mailru_private_key = app_private_key
        @options = options
        super(app, :mailru)
      end

      attr_reader :app_id
      attr_reader :app_private_key
      
      def request_phase
        Rack::Response.new(mailru_login_page).finish
      end
      
      def auth_hash
        OmniAuth::Utils.deep_merge(super(), {
          'uid' => request[:uid],
          'user_info' => {
            'nick' => request[:nick],
            'email' => request[:email],
            'name' => "#{request[:first_name]} #{request[:last_name]}",
            'first_name' => request[:first_name],
            'last_name' => request[:last_name],
            'picture' => request[:has_pic] ? request[:pic] : nil,
            'country' => request[:country],
            'town' => request[:city],
            'urls' => { 'Page' => request[:link] }
          },
          'extra' => {'user_hash' => request}
        })
      end
    end
  end
end
