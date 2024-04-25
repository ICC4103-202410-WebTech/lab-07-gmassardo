class AddTableTags < ActiveRecord::Migration[7.1]
  def change
    create_tanble :tags do |t|
      t.string :name, null:false
      
      t.timestamps
    end 
  end
end
