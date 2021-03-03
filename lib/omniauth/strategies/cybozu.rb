# frozen_string_literal: true

require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Cybozu < OmniAuth::Strategies::OAuth2
      option :name, 'cybozu'

      option :skip_info, true

      option :client_options, authorize_url: '/oauth2/authorization',
               token_url: '/oauth2/token'

    private

      def callback_url
        full_host + callback_path
      end
    end
  end
end
