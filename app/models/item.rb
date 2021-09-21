class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :category
  belongs_to :status
  belongs_to :lord
  belongs_to :area
  belongs_to :scheduled_delivery
  belongs_to :user
  # has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :price, format: { with: /\A[0-9]+\z/ }, inclusion: { in: 300..9_999_999 }
    validates :image
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :lord_id
    validates :area_id
    validates :scheduled_delivery_id
  end
end
