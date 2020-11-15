module V1
  module Admin
    class ImageSerializer < ApplicationSerializer
      attributes :path,
                 :sizes,
                 :formats,
                 :alt,
                 :caption

      belongs_to :company

      has_many :products, if: requested?('products')
      has_many :product_images, if: requested?('product_images')
      has_many :cdn_files, if: requested?('cdn_files')
    end
  end
end
