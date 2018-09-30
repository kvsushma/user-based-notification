class Sector < ActiveRecord::Base
    belongs_to :user
    belongs_to :role
    
    after_create_commit :sector_subscriber

	private

	def sector_subscriber
		SectorSubscriberJob.perform_later(self)
	end
end
