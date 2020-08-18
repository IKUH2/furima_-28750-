class User < ApplicationRecord
  has_many :item_imgs, dependent: :destroy
  has_one :user_evaluation
  belongs_to :brand
end
