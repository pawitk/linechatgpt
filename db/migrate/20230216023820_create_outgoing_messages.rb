class CreateOutgoingMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :outgoing_messages do |t|
      t.references :incoming_message, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
