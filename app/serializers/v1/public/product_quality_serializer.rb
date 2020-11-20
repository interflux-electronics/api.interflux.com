module V1
  module Public
    class ProductQualitySerializer < ApplicationSerializer
      belongs_to :product
      belongs_to :quality
    end
  end
end
