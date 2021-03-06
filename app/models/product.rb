class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  # commented this out.  monetize gem above was commented out when the below was active.
  # def price
  #   price_cents / 100.0
  # end

  # def category
  #   # Category.find(category_id)
  # end

  def new
  
  end

end
