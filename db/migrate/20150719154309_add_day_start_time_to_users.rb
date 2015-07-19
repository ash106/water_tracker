class AddDayStartTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :day_start_time, :integer
  end
end
