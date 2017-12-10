# == Schema Information
#
# Table name: product_translations
#
#  id         :integer          not null, primary key
#  product_id :integer
#  locale     :string
#  name       :string
#  body       :text
#  pitch      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductTranslation < ApplicationRecord
  has_one :product
end
