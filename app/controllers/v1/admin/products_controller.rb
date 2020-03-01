module V1
  module Admin
    class ProductsController < ApplicationController
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
        # TODO allow_destroy if user.can_destroy(:product)
        allow_destroy
      end

      private

      def resource_klass
        Product
      end

      def serializer_klass
        V1::Admin::ProductSerializer
      end

      def creatable_attributes
        %i[]
        # %i[
        #   name
        #   company
        #   email
        #   mobile
        #   message
        #   purpose
        #   source
        #   ip
        #   ip_region
        #   ip_city
        # ]
      end

      def creatable_relationships
        %i[]
        # %i[
        #  country
        #  ip_country
        # ]
      end

      def permitted_filters
        %i[
          deprecated
        ]
        # %i[
        #  main_group_id
        #  sub_group_id
        # ]
      end

      def permanent_filters
        {}
        # {
        #   public: true
        # }
      end

      def permitted_includes
        %i[
          images
          documents
          documents.language
          product_family
        ]
        # %i[
        #   related_articles
        #   related_products
        #   related_products.main_group
        #   translations
        # ]
      end

      # def after_create(lead)
      #   PostLeadToSlackJob.perform_later lead
      # end
    end
  end
end
