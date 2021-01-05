module V1
  module Public
    class UsesController < ApplicationController
      def index
        allow_index
      end

      def show
        allow_show
      end

      def create
        forbidden
      end

      def update
        forbidden
      end

      def destroy
        forbidden
      end

      private

      def model_class
        Use
      end

      def serializer_class
        V1::Public::UseSerializer
      end

      def permitted_includes
        %i[
          image
          products
          products.image
          products.product_family
          product_uses
          images
        ]
      end
    end
  end
end
