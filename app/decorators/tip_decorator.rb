class TipDecorator < ApplicationDecorator
  delegate_all

  def title
    object.title.truncate(50)
  end
end
