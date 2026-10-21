class PagesController < ApplicationController
  def home
    @featured = Catalog.featured
  end

  def shop
    @sections = Catalog.sections
  end

  def merch; end
  def made_to_order
    @request = PrintRequest.new
  end
  def about; end
  def privacy; end
end
