class ChangeYearCompleted < ActiveRecord::Migration
  change_column :landmarks, :year_completed, :integer
end
