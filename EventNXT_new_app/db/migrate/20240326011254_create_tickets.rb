#class CreateTickets < ActiveRecord::Migration[7.0]
#  def change
#    create_table :tickets do |t|
#      t.belongs_to :referral
#      t.string  :ticket_referee, null: false
#      t.boolean :ticket_status, default: false
#      t.integer :ticket_quantity, default: 0
#      t.integer :ticket_amount, default: 0

#      t.timestamps
#    end
#  end
#end
