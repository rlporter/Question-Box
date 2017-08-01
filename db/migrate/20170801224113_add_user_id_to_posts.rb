class AddUserIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :user_id, foreign_key: true
  end
end
