class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  belongs_to :contact
end
