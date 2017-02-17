class Review < ActiveRecord::Base

  class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  validates :rating, presence: true

end

