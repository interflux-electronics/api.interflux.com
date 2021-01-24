module V1
  module Public
    class UseSerializer < ApplicationSerializer
      attributes :slug,
                 :text,
                 :icon,
                 :gist,
                 :rank

      belongs_to :image

      has_many :products, if: requested?('products')
      has_many :product_uses, if: requested?('product_uses')
      has_many :images, if: requested?('images')
    end
  end
end