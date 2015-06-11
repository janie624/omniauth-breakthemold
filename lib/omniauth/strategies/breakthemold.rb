require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Breakthemold < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, 'breakthemold'

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, { site: "https://www.breakthemold.co.uk", token_url: "/oauth/request_token", access_url: "/oauth/authorize" }
      option :authorize_params, { state: '1' }
      option :token_params, { oauth: 'request_token' }
      
      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid { raw_info['ID'] }

      info do
        {
          name: raw_info['display_name'],
          email: raw_info['user_email'],
          nickname: raw_info['user_nicename'],
          role: raw_info['user_role']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get(options[:client_options][:access_url], params: { oauth: 'request_access' }).parsed
      end
    end
  end
end