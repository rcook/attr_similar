class Widget < ActiveRecord::Base
  attr_accessible :address,
    :birthdate,
    :first_name,
    :last_name,
    :preferred_name

  attr_similar [1, 2, 2, 3, 3],
    :address,
    :birthdate,
    :first_name,
    :last_name,
    :preferred_name
end

