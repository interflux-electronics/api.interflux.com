module V1
  module Public
    class ProductsController < ApplicationController
      include JsonApi
      include Errors

      def index
        user_can_fetch_all
      end

      def show
        user_can_fetch_one_by_id_or_slug
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

      def resource_klass
        Product
      end

      def serializer_klass
        V1::Public::ProductSerializer
      end

      def attributes
        %i[]
      end

      def relationships
        %i[
          related_products
          related_articles
        ]
      end

      def filters
        %i[
          main_group_id
          sub_group_id
        ]
      end

      def includes
        %i[
          related_products
          related_articles
        ]
      end
    end
  end
end
