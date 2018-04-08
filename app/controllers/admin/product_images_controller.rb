module Admin
  class ProductImagesController < Admin::AuthenticatedController
    def index
      super
    end

    def show
      super
    end

    def create
      super
    end

    def update
      super
    end

    def destroy
      super
    end

    private

    def resource_klass
      ProductImage
    end

    def serializer_klass
      Admin::ProductImageSerializer
    end

    def attributes
      %i[
        alt
      ]
    end

    def relationships
      %i[
        product_id
      ]
    end

    def filters
      %i[
        product_id
      ]
    end

    def includes
      %i[]
    end
  end
end
