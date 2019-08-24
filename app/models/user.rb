class User < ActiveRecord::Base
  has_secure_password

  def prefixed_name
    "Mr. " + name
  end
end
