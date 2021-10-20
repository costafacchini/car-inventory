class AddDealershipAtCars < ActiveRecord::Migration[6.1]
  def change
    add_reference :cars, :dealership, foreign_key: true, index: true
  end
end
