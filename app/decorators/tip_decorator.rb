class TipDecorator < ApplicationDecorator
  delegate_all

  def created_at
    object.created_at.strftime("%a %d/%m/%y")
  end

  def title
    object.title.truncate(50)
  end
end
