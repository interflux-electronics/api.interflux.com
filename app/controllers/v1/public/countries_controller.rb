module V1
  module Public
    class CountriesController < ApplicationController
      include JsonApi
      include Errors

      def index
        user_can_fetch_all
      end

      def show
        user_can_fetch_one
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
        Country
      end

      def serializer_klass
        CountrySerializer
      end

      def attributes
        %i[]
      end

      def relationships
        %i[]
      end

      def filters
        %i[]
      end

      def includes
        %i[]
      end
    end
  end
end
