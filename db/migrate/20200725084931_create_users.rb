class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_account
      t.string :disp_name
      t.string :mail
      t.string :password

      t.timestamps
    end
  end
end
