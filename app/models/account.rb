class Account < ActiveRecord::Base
  has_many :access_tokens
  has_many :clients
end
