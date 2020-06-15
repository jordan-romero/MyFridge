class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name 
      t.string :expy_date
      t.references :itemizable, polymorphic: true, index: true 
      t.timestamps 
    end
  end 
end
