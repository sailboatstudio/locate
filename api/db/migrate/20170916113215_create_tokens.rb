class CreateTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :tokens do |t|
      t.string :token
      t.string :token_type
      t.boolean :active
      t.string :owner_type
      t.integer :owner_id
    end
  end
end
