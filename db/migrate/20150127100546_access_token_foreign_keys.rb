class AccessTokenForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key  :access_tokens,:refresh_tokens
    add_foreign_key  :access_tokens,:accounts
    add_foreign_key  :access_tokens,:clients
  end
end
