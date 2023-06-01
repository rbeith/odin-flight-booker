class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email

			t.timestamps
    end
		add_reference :flights, :booking, foreign_key: true

  end
end
