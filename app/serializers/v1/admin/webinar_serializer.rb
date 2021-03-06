module V1
  module Admin
    class WebinarSerializer < ApplicationSerializer
      attributes :title,
                 :topic,
                 :audience,
                 :url,
                 :start_time,
                 :duration,
                 :public

      belongs_to :person

      has_many :webinar_invitees, if: requested?('webinar_invitees')
    end
  end
end
