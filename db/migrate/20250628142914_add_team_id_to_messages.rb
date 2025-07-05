class AddTeamIdToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :team_id, :integer
  end
end
