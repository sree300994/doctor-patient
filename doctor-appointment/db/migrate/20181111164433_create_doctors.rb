class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialization
      t.string :mobile

      t.timestamps
    end
  end
end
