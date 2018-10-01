module ApplicationHelper
	def users_roles user
    roles = ''
    user.roles.each do |role|
      roles << "#{role.name} "
    end
    roles
  end
end
