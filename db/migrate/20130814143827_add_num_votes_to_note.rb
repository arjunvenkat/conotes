class AddNumVotesToNote < ActiveRecord::Migration
  def change
    add_column :notes, :num_votes, :integer, default: 0
  end
end
