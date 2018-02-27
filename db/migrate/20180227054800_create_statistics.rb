class CreateStatistics < ActiveRecord::Migration[5.1]
  def change
    create_table :statistics do |t|
      t.integer :statistic_user_id
      t.integer :followers_count
      t.integer :followings_count
      t.integer :media_count
    end
  end
end
