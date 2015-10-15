class User < ActiveRecord::Base
	def isSecurePassword
		!self.password.nil? &&
		self.password.length > 8 &&
		!self.password.match("[0-9]").nil? &&
		!self.password.match("[A-Z]").nil?
	end
end

class Address < ActiveRecord::Base
end

class Post < ActiveRecord::Base
end