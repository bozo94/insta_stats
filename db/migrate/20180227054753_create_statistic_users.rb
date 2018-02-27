class CreateStatisticUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :statistic_users do |t|
      t.string :nick
      t.string :slug
      t.string :instagram_id
    end
  end
end
