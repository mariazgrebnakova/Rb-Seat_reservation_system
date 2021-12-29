class AddCoordinatesToSeat < ActiveRecord::Migration[6.1]
  def change
    add_column :seats, :coordinates, :string
  end
end
