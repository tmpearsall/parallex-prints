# A published Parallex Prints story: a row of public.posts (app_id "prints", kind "blog") in the Parallex
# Supabase project, read through the prints_ro login, which can see only published Prints posts.
class Story < ApplicationRecord
  self.table_name = "posts"
  default_scope { where(app_id: "prints", kind: "blog", status: "published").where("published_at <= now()") }
  scope :newest, -> { order(published_at: :desc) }

  def readonly? = true

  # Never let a database problem take the page down: the Stories pages fall back to "coming soon".
  def self.safely
    return [] unless ENV["DATABASE_URL"].present?
    yield
  rescue StandardError => e
    Rails.logger.warn("[stories] unavailable: #{e.class}")
    []
  end

  def to_param = slug
  def tag_list = Array(tags)
  def minutes = [(body.to_s.split.size / 220.0).ceil, 1].max
end
