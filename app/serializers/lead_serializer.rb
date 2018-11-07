# == Schema Information
#
# Table name: leads
#
#  id         :uuid             not null, primary key
#  name       :string
#  company    :string
#  email      :string
#  mobile     :string
#  message    :string
#  purpose    :string
#  source     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LeadSerializer < ApplicationSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id,
             :name,
             :company,
             :email,
             :mobile,
             :message,
             :purpose,
             :source

  belongs_to :country
end
