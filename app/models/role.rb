class Role < ActiveRecord::Base
    has_many :sectors
	has_many :users, through: :sectors
	validates :name, presence: true, uniqueness: { case_sensitive: false }
  	has_many :messages
end
