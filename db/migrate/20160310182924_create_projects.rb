class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_type
      t.string :platform_type
      t.string :content_type
      t.string :project_name
      t.text :summary
      t.string :launch_date
      t.boolean :active
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
