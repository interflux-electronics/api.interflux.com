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
    # https://www.interflux.com
    # https://lmpa.interflux.com
    #
    namespace :public do
      resources :countries
      resources :leads
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
      resources :article_tags, path: '/article-tags'
      resources :articles
      resources :companies
      resources :containers
      resources :countries
      resources :country_currencies, path: '/country-currencies'
      resources :country_languages, path: '/country-languages'
      resources :currencies
      resources :documents
      resources :employees
      resources :features
      resources :images
      resources :languages
      resources :leads
      resources :people
      resources :person
      resources :product_complements, path: '/product-complements'
      resources :product_documents, path: '/product-documents'
      resources :product_families, path: '/product-families'
      resources :product_features, path: '/product-features'
      resources :product_images, path: '/product-images'
      resources :product_related_articles, path: '/product-related-articles'
      resources :product_substitutes, path: '/product-substitutes'
      resources :product_variants, path: '/product-variants'
      resources :products
      resources :tags
    end
  end

  # Return app meta info for health check.
  get 'status', to: 'application#status'

  # Return a 404 for all other routes.
  match '*catch', to: 'application#route_not_found', via: :all
end
