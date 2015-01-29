class AccessToken < ActiveRecord::Base
  @@default_lifetime = 15.days
  belongs_to :account
  belongs_to :client

  before_validation :setup, :on => :create
  validates :client, :expires_at, :presence => true
  validates :token, :presence => true, :uniqueness => true

  scope :valid, lambda {
                where(:expires_at.gte => Time.now.utc)
              }

  def to_bearer_token(with_refresh_token = false)
    bearer_token = Rack::OAuth2::AccessToken::Bearer.new(
        :access_token => self.token,
        :expires_in => self.expires_in
    )
    bearer_token
  end

  def expires_in
    (expires_at - Time.now.utc).to_i
  end

  def expired!
    self.expires_at = Time.now.utc
    self.save!
  end

  private

  def setup

    self.token = SecureRandom.base64(64)
    self.expires_at ||= @@default_lifetime.from_now
  end
end
