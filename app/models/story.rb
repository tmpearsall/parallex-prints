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
  # Reading time, Medium's way (same formula on every site): 265 words a minute plus time for images
  # (12s for the first, one less for each after, never under 3s), whole minutes rounded up, minimum 1.
  # The Sources list is left out.
  def minutes
    main = body.to_s.split(/<h2[^>]*>\s*Sources\s*<\/h2>/i).first.to_s
    images = main.scan(/<img\b/i).size
    words = main.gsub(/<[^>]+>/, " ").gsub(/&[a-z#0-9]+;/i, " ").scan(/\S+/).size
    secs = words * 60.0 / 265
    images.times { |i| secs += [12 - i, 3].max }
    [(secs / 60.0).ceil, 1].max
  end
end
