class AddTicketNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ticket_number, :string
  end
end
