class AddPosterUidAndPosterProfileUrlToCard < ActiveRecord::Migration
  def change
    add_column :cards, :poster_uid, :string
    add_column :cards, :poster_profile_url, :string
  end
end
