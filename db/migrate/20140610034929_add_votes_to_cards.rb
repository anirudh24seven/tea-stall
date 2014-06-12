class AddVotesToCards < ActiveRecord::Migration
  def change
    add_column :cards, :votes_count, :integer
  end
end
