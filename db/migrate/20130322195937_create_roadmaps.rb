class CreateRoadmaps < ActiveRecord::Migration
  def change
    create_table :roadmaps do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
