# == Schema Information
#
# Table name: images
#
#  id         :uuid             not null, primary key
#  path       :string
#  text       :string
#  sizes      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Image < ApplicationRecord
  # Relate to a model
  # belongs_to :company
  # belongs_to :main_group, class_name: 'ProductGroup', foreign_key: 'main_group_id'
  # belongs_to :sub_group, class_name: 'ProductGroup', foreign_key: 'sub_group_id'

  # Relate to many of another model
  # Requires intermediary model ProductRelatedArticle
  # has_many :related_articles_association, class_name: 'ProductRelatedArticle'
  # has_many :related_articles, through: :related_articles_association, source: :article

  # Relate to many of same model
  # Requires intermediary model ProductRelatedProduct
  # has_many :related_products_association, class_name: 'ProductRelatedProduct'
  # has_many :related_products, through: :related_products_association, source: :related_product
  # has_many :inverse_related_products_association, class_name: 'ProductRelatedProduct', foreign_key: 'related_product_id'
  # has_many :inverse_related_products, through: :inverse_related_products_association, source: :product

  # validates :name, presence: true, uniqueness: true
end
