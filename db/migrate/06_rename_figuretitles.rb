class RenameFiguretitles < ActiveRecord::Migration
  def change
    rename_table :figure_titles, :figuretitles
  end
end
