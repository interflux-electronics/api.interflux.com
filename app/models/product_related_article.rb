# == Schema Information
#
# Table name: product_related_articles
#
#  id         :uuid             not null, primary key
#  product_id :uuid
#  article_id :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductRelatedArticle < ApplicationRecord
  belongs_to :product
  belongs_to :article

  validates :product, presence: true
  validates :article, presence: true
end