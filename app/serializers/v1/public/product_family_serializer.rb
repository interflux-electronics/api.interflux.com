module V1
  module Public
    class ProductFamilySerializer < ApplicationSerializer
      attributes :slug,
                 :code,
                 :name_single,
                 :name_plural
    end
  end
end