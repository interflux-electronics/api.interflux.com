# == Schema Information
#
# Table name: product_translations
#
#  id          :integer          not null, primary key
#  body        :text
#  pitch       :text
#  product_id  :integer
#  language_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ProductTranslation < ApplicationRecord
  belongs_to :product
  belongs_to :language
end
