class User < ApplicationRecord
  has_many :item_imgs, dependent: :destroy
end
