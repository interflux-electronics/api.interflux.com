module V1
  module Public
    class ProductQualitiesController < ApplicationController
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
        ProductQuality
      end

      def serializer_class
        V1::Public::ProductQualitySerializer
      end
    end
  end
end
