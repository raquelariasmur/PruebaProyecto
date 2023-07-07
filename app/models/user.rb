class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: true }, length: { maximum: 40 }

  validates :password, presence: true, length: { minimum: 4, maximum: 40 }
  has_secure_password

  validates :usertype, presence: true
  enum usertype: { administrator: 0, kitchener: 1 }

  scope :filter_by_username, ->(username, search_by_usertype) {
          where("UPPER(username) LIKE UPPER(?) OR usertype = ?", "%#{username}%", search_by_usertype)
        }
end
