class User < ActiveRecord::Base
  has_secure_password
  
  def name
    "#{first_name} #{last_name}"
  end

  def name=(string)
    names = string.split(" ")
    self.first_name, self.last_name = case names.count
      when 1,2
        names
      when 3
        [names.first, names.last]
    end
  end
end
