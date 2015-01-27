class RefrashTokenForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key  :refresh_tokens,:clients
  end
end
