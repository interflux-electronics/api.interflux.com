module V1
  module Admin
    class ProductsController < V1::AdminController
      def index
        allow_index
      end

      def show
        allow_show
      end

      def create
        allow_create
      end

      def update
        allow_update
      end

      def destroy
        forbidden
      end

      private

      def model_class
        Product
      end

      def serializer_class
        V1::Admin::ProductSerializer
      end

      def permitted_filters
        %i[
          name
        ]
      end

      def permitted_includes
        %i[
          image
          images
          documents
          documents.language
          product_images
          product_images.image
          product_family
          features
        ]
      end

      def creatable_attributes
        %i[
          slug
          name
          label
          pitch
          properties
          public
          orderable
          featured
          popular
          new
        ]
      end

      def creatable_relationships
        %i[
          image
        ]
      end
    end
  end
end
