# == Schema Information
#
# Table name: products
#
#  id               :uuid             not null, primary key
#  name             :string
#  slug             :string
#  public           :boolean          default(FALSE)
#  pitch            :text
#  body             :text
#  main_category_id :uuid
#  sub_category_id  :uuid
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Product < ApplicationRecord
  belongs_to :main_category, class_name: 'ProductCategory', foreign_key: 'main_category_id', optional: true
  belongs_to :sub_category, class_name: 'ProductCategory', foreign_key: 'sub_category_id', optional: true

  has_many :product_images
  has_many :product_features
  has_many :product_translations

  # def product_image_sources
  #   byebug
  #   product_images.image_sources
  # end
  # delegate :product_images_sources, to: :product_images.image_sources
  # delegate :name, to: :provider, prefix: true

  scope :which_are_public, -> { where(public: true) }
  scope :where_main_category, ->(slug) { where(main_category: ProductCategory.where(slug: slug)) }
  scope :where_sub_category, ->(slug) { where(sub_category: ProductCategory.where(slug: slug)) }

  # TODO: Use joins() instead of construction above
  # Product.joins(:main_category).where(:product_categories => {:slug => "solder-wires"})

  before_save :generate_slug
  
  # TODO: before_destroy :delete_images
  # TODO: before_destroy :delete_features
  # TODO: before_destroy :delete_translations
  # TODO: before_destroy :delete_product_images
  # TODO: before_destroy :delete_product_features
  # TODO: before_destroy :delete_product_translations

  private

  def generate_slug
    self.slug = name.parameterize(preserve_case: true)
  end
end