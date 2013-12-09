class Widget < ActiveRecord::Base
  attr_similar [1, 2, 2, 3, 3],
    :address,
    :birthdate,
    :first_name,
    :last_name,
    :preferred_name

  private

  def widget_params
    params.permit(
      :address,
      :birthdate,
      :first_name,
      :last_name,
      :preferred_name
    )
  end
end

