class Client < ApplicationRecord
  validates :firstname, presence: true, length: { minimum: 2, maximum: 40 }
  validates :lastname, presence: true, length: { minimum: 2, maximum: 40 }
  validates :email, uniqueness: true, presence: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :direction, presence: true, length: { minimum: 10, maximum: 200 }
  validates :enabled, inclusion: { in: [true, false] }
  validates :password, presence: true, length: { minimum: 4, maximum: 40 }, if: :password_required?

  private

    def password_required?
      password.present?
    end

  has_many :orders, dependent: :destroy
  has_secure_password
  scope :filter_in_search, ->(search, search_by_enabled) {
    where("UPPER(firstname) LIKE UPPER(?) OR UPPER(lastname) LIKE UPPER(?) OR UPPER(email) LIKE UPPER(?) OR enabled = ? OR UPPER(direction) LIKE UPPER(?) OR CONCAT(UPPER(firstname) , ' ', UPPER(lastname) ) LIKE UPPER(?)",
    "%#{search}%", "%#{search}%", "%#{search}%", search_by_enabled, "%#{search}%", "%#{search}%")
  } 
end
