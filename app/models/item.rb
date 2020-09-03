class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :delv_fee
  belongs_to_active_hash :delv_from
  belongs_to_active_hash :delv_time
  has_one_attached :image
  has_one_attached :information

  has_many :item_imgs, dependent: :destroy
  has_one :user_evaluation

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_condition_id
    validates :delv_fee_id
    validates :delv_from_id
    validates :delv_time_id
  end

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :image
    validates :information
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } 
end