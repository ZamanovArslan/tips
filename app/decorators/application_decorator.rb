class ApplicationDecorator < Draper::Decorator
  delegate :to_model

  def created_at
    object.created_at.strftime("%a %d/%m/%y")
  end

  def self.collection_decorator_class
    PaginatingDecorator
  end
end
