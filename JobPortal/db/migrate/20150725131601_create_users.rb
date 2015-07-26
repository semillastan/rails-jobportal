class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string      :first_name
      t.string      :last_name
      t.string      :email
      t.string      :password
      t.has_many    :jobs

      t.timestamps null: false
    end
  end
end
