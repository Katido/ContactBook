class AccessToken < ActiveRecord::Base
  include Oauth2Token
  self.default_lifetime = 15.days
  belongs_to :client
  belongs_to :account

  def to_bearer_token(with_refresh_token = false)
    bearer_token = Rack::OAuth2::AccessToken::Bearer.new(
        :access_token => self.token,
        :expires_in => self.expires_in
    )
    bearer_token
  end
end
