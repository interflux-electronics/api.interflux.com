module V1
  module Admin
    class ProductSerieSerializer < ApplicationSerializer
      attributes :slug,
                 :code,
                 :name,
                 :public,
                 :continued,
                 :created_at,
                 :updated_at

      belongs_to :product_family
    end
  end
end