class RemovePasswordFromUsers < ActiveRecord::Migration[6.0]
  def change
    def up
      t.string "encrypted_password", default: ""
    end
  
    def down
      t.string "encrypted_password", default: "", null: false
    end
  end
end
