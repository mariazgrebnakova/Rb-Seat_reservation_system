class AddDepartmentToSeats < ActiveRecord::Migration[6.1]
  def change
    add_column(:seats, :department_id, 'integer', index: true)
    add_foreign_key :seats, :departments


    # add_reference :seats, :departments, index: true, foreign_key: true
  end
end


