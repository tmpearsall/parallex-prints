class StoriesController < ApplicationController
  def index
    @stories = Story.safely { Story.newest.to_a }
  end

  def show
    @story = Story.safely { Story.find_by(slug: params[:slug]) }
    @story = nil if @story.is_a?(Array)
    return render(file: Rails.public_path.join("404.html"), status: :not_found, layout: false) unless @story
  end
end
