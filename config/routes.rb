Rails.application.routes.draw do
  # Make the API future proof by versioning v1
  namespace :v1 do
    # Public endpoints
    # These endpoints are meant for the public. No sensitive information is ever
    # made available here. Initially these endpoints will be consumed by our
    # public facing websites, but we anticipate and allow also third parties,
    # such as scrapers and bots, to read from them.
    #
    # Used by:
    # https://app.interflux.com
    # https://www.interflux.com
    # https://lmpa.interflux.com
    #
    namespace :public do
      resources :article_categories, path: '/article-categories'
      resources :articles
      resources :companies
      resources :countries
      resources :document_categories, path: '/document-categories'
      resources :documents
      resources :features
      resources :images
      resources :languages
      resources :leads
      resources :product_families, path: '/product-families'
      resources :product_qualities, path: '/product-qualities'
      resources :product_uses, path: '/product-uses'
      resources :products
      resources :qualities
      resources :uses
      resources :webinars
    end

    # Admin endpoints
    # These endpoints are meant for internal use by authenticated users such as
    # Interflux employees. These endpoints commonly allow read, create, update
    # and destroy.
    #
    # Used by:
    # https://admin.interflux.com
    #
    namespace :admin do
      resources :article_categories, path: '/article-categories'
      resources :articles
      resources :cdn_files, path: '/cdn-files'
      resources :companies
      resources :company_markets, path: '/company-markets'
      resources :company_members, path: '/company-members'
      resources :countries
      resources :document_categories, path: '/document-categories'
      resources :documents
      resources :features
      resources :images
      resources :languages
      resources :leads
      resources :people
      resources :product_documents, path: '/product-documents'
      resources :product_families, path: '/product-families'
      resources :product_family_images, path: '/product-family-images'
      resources :product_features, path: '/product-features'
      resources :product_images, path: '/product-images'
      resources :product_qualities, path: '/product-qualities'
      resources :product_uses, path: '/product-uses'
      resources :products, path: '/products'
      resources :qualities
      resources :use_images, path: '/use-images'
      resources :users
      resources :uses
      resources :webinars
      resources :webinar_invitees, path: '/webinar-invitees'

      # Non-CRUD requests
      post '/auth-token', to: 'authentication#token'
    end
  end

  # Return app meta info for health check.
  get 'sanity-check', to: 'sanity#check'

  # Return a 404 for all other routes.
  match '*catch', to: 'application#render_404', via: :all
end
