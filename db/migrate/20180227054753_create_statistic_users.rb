class CreateStatisticUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :statistic_users do |t|
      t.string :nick
      t.string :slug
      t.string :instagram_id
      t.string :name
      t.string :image
    end
  end
end
