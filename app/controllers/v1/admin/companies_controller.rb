module V1
  module Admin
    class CompaniesController < V1::AdminController
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

      def resource_klass
        Company
      end

      def serializer_klass
        V1::Admin::CompanySerializer
      end

      def creatable_attributes
        %i[
          address
          business_name
          emails
          fax
          latitude
          
          longitude
          phone
          public
          slug
          website
        ]
      end

      def creatable_relationships
        %i[
         country
        ]
      end
    end
  end
end
