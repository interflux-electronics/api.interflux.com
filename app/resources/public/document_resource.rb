module Public
  class DocumentResource < JSONAPI::Resource
    attributes :name,
               :document_type,
               :public,
               :url
  end
end
