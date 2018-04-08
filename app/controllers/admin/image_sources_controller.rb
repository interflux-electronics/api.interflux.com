module Admin
  class ImageSourcesController < Admin::AuthenticatedController
    def index
      forbidden
    end

    def show
      forbidden
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
      ImageSource
    end

    def serializer_klass
      Admin::ImageSourceSerializer
    end

    def attributes
      %i[
        url
        width
        height
      ]
    end

    def relationships
      {
        image_id: permit_relationship('image')['id']
      }
    end

    def filters
      %i[]
    end

    def includes
      %i[]
    end
  end
end
