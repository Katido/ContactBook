class TokenEndpoint
  def call(env)
    authenticator.call(env)
  end

  private

  def authenticator
    Rack::OAuth2::Server::Token.new do |req, res|
      client = Client.find_by_identifier(req.client_id) || req.invalid_client!
      client.secret == req.client_secret || req.invalid_client!
      if req.grant_type == :password
        account = Account.find_by_username_and_password(req.username, req.password) || req.invalid_grant!
        res.access_token = account.access_tokens.create(:client => client).to_bearer_token(:with_refresh_token)
      else
        req.unsupported_grant_type!
      end
    end
  end
end