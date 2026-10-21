# A custom-order request, written to public.print_requests in the Parallex Supabase project through the
# insert-only prints_app login (REQUESTS_DATABASE_URL). That login cannot read, change or delete anything.
class PrintRequest
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :email, :string
  attribute :description, :string
  attribute :quantity, :string
  attribute :needed_by, :string

  validates :name, presence: true, length: { maximum: 200 }
  validates :email, presence: true, length: { maximum: 320 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :description, presence: true, length: { maximum: 5000 }
  validates :quantity, :needed_by, length: { maximum: 200 }

  class Db < ActiveRecord::Base
    self.abstract_class = true
    establish_connection(ENV["REQUESTS_DATABASE_URL"]) if ENV["REQUESTS_DATABASE_URL"].present?
  end

  def self.available? = ENV["REQUESTS_DATABASE_URL"].present?

  # Insert without RETURNING: the login has no SELECT.
  def save
    return false unless valid?
    return false unless self.class.available?
    c = Db.connection
    c.exec_query(
      "INSERT INTO public.print_requests (name, email, description, quantity, needed_by) VALUES ($1,$2,$3,$4,$5)",
      "PrintRequest insert",
      [name.strip, email.strip, description.strip, quantity.to_s.strip.presence, needed_by.to_s.strip.presence]
    )
    true
  rescue StandardError => e
    Rails.logger.warn("[print_request] save failed: #{e.class}")
    errors.add(:base, "We could not save that just now. Please email #{Catalog::EMAIL} instead.")
    false
  end
end
