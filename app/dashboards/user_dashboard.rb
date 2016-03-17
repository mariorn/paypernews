require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    transactions: Field::HasMany,
    articles: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    last_name: Field::String,
    alias: Field::String,
    email: Field::String,
    nif: Field::String,
    phone: Field::Number,
    genre: Field::String,
    location: Field::String,
    credit_card: Field::Number,
    biography: Field::Text,
    avatar: Field::String,
    score: Field::Number.with_options(decimals: 2),
    admin: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    avatar_file_name: Field::String,
    avatar_content_type: Field::String,
    avatar_file_size: Field::Number,
    avatar_updated_at: Field::DateTime,
    writer: Field::Boolean,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :transactions,
    :articles,
    :id,
    :name,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :transactions,
    :articles,
    :id,
    :name,
    :last_name,
    :alias,
    :email,
    :nif,
    :phone,
    :genre,
    :location,
    :credit_card,
    :biography,
    :avatar,
    :score,
    :admin,
    :created_at,
    :updated_at,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :avatar_file_name,
    :avatar_content_type,
    :avatar_file_size,
    :avatar_updated_at,
    :writer,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :transactions,
    :articles,
    :name,
    :last_name,
    :alias,
    :email,
    :nif,
    :phone,
    :genre,
    :location,
    :credit_card,
    :biography,
    :avatar,
    :score,
    :admin,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :avatar_file_name,
    :avatar_content_type,
    :avatar_file_size,
    :avatar_updated_at,
    :writer,
  ]

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
