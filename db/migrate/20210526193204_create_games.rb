class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|

      t.string :name
      t.string :tablero
      t.string :simbolo
      t.string :lastplay, default: ""

      t.timestamps
    end
  end
end
