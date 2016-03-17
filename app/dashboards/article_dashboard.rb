require "administrate/base_dashboard"

class ArticleDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    transactions: Field::HasMany,
    users: Field::HasMany,
    categories: Field::HasMany,
    id: Field::Number,
    user_id: Field::Number,
    title: Field::String,
    lead: Field::Text,
    body: Field::Text,
    price: Field::Number.with_options(decimals: 2),
    visits: Field::Number,
    score: Field::Number.with_options(decimals: 2),
    publish: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    publish_at: Field::DateTime,
    photo1_file_name: Field::String,
    photo1_content_type: Field::String,
    photo1_file_size: Field::Number,
    photo1_updated_at: Field::DateTime,
    photo2_file_name: Field::String,
    photo2_content_type: Field::String,
    photo2_file_size: Field::Number,
    photo2_updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :transactions,
    :users,
    :categories,
    :id,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :transactions,
    :users,
    :categories,
    :id,
    :user_id,
    :title,
    :lead,
    :body,
    :price,
    :visits,
    :score,
    :publish,
    :created_at,
    :updated_at,
    :publish_at,
    :photo1_file_name,
    :photo1_content_type,
    :photo1_file_size,
    :photo1_updated_at,
    :photo2_file_name,
    :photo2_content_type,
    :photo2_file_size,
    :photo2_updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :transactions,
    :users,
    :categories,
    :user_id,
    :title,
    :lead,
    :body,
    :price,
    :visits,
    :score,
    :publish,
    :publish_at,
    :photo1_file_name,
    :photo1_content_type,
    :photo1_file_size,
    :photo1_updated_at,
    :photo2_file_name,
    :photo2_content_type,
    :photo2_file_size,
    :photo2_updated_at,
  ]

  # Overwrite this method to customize how articles are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(article)
  #   "Article ##{article.id}"
  # end
end
