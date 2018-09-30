class Role < ActiveRecord::Base
    has_many :sectors
	has_many :users, through: :sectors
end
