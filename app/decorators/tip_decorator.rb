class TipDecorator < ApplicationDecorator
  delegate_all

  def created_at
    object.created_at.strftime("%a %d/%m/%y")
  end
end
