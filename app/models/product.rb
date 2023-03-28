class Product < ApplicationRecord

    has_one_attached :product_image

    belongs_to :category

    validates :quantity, presence:true, numericality: { greater_than_or_equals: 0, less_than: 10 }
    validates :price, presence:true, numericality: { greater_than: -1 }

end
