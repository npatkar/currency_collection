class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits, :id => false do |t|
      t.string :country_id
      t.string :user_id
      t.timestamps
    end
  end
end
