class SectorSubscriberJob < ApplicationJob
  queue_as :default

  def perform(sector)
    ActionCable.server.broadcast "role-#{sector.role_id}:sectors", sector: render_sector(sector)
  end

  private

  def render_sector(sector)
    SectorsController.render partial: 'sectors/sector', locals: {sector: sector}
  end
end
