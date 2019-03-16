class CreatePlannerCustoms < ActiveRecord::Migration[5.2]
  def change
    create_table :planner_customs do |t|
      t.references :purchase, foreign_key: true
      t.references :user, foreign_key: true
      t.string :status
      t.datetime :date_ordered
      t.datetime :date_starting
      t.string :time_period
      t.string :planner_increment
      t.boolean :monthly
      t.text :monthly_comments
      t.boolean :weekly
      t.text :weekly_comments
      t.boolean :daily
      t.text :daily_comments
      t.text :schedule
      t.text :segments
      t.string :adjectives
      t.string :colors
      t.string :fonts
      t.string :themes
      t.boolean :logo
      t.string :personalization
      t.string :tagline
      t.text :other_comments
      t.boolean :submitted

      t.timestamps
    end
  end
end
