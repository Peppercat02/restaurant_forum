class Comment < ApplicationRecord
    t.text :content
    t.integer :restaurant_id
    t.integer :user_id
end
