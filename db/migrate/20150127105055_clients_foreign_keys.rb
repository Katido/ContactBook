class ClientsForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key  :clients,:accounts
  end
end
