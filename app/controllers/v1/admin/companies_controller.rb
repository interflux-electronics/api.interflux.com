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

      def model_class
        Company
      end

      def serializer_class
        V1::Admin::CompanySerializer
      end

      def permitted_filters
        %i[
          business_name
        ]
      end

      def permitted_includes
        %i[
          country
          company_members
          company_markets
          company_members.person
          company_markets.country
        ]
      end

      def creatable_attributes
        %i[
          address
          business_name
          legal_name
          email_general
          email_orders
          email_support
          email_accounting
          fax
          latitude
          longitude
          phone
          public
          slug
          website
          order
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
