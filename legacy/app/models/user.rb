# == Schema Information
#
# Table name: users
#
#  id               :uuid             not null, primary key
#  name             :string
#  email            :string
#  password_digest  :string
#  can_access_admin :boolean          default(FALSE)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class User < ApplicationRecord
  has_secure_password
end