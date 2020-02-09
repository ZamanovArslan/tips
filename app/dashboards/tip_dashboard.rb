require "administrate/base_dashboard"

class TipDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    life_area: Field::BelongsTo,
    user: Field::BelongsTo,
    likes: Field::HasMany,
    comments: Field::HasMany,
    users: Field::HasMany,
    impressions: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    anonym: Field::Boolean,
    description: Field::Text,
    experience: Field::Number,
    experience_ext: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    likes_count: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  title
  life_area
  user
  likes
  comments
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  life_area
  user
  likes
  comments
  users
  impressions
  id
  title
  anonym
  description
  experience
  experience_ext
  created_at
  updated_at
  likes_count
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  life_area
  user
  likes
  comments
  users
  impressions
  title
  anonym
  description
  experience
  experience_ext
  likes_count
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how tips are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(tip)
    "Tip ##{tip.id} #{tip.title}"
  end
end
