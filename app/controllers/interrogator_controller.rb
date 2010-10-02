class InterrogatorController < ApplicationController
  before_filter :get_author
  before_filter :get_photo

  def index
    if params && params[:question]
      @ci = ChunkInterrogator.new(params[:slug], params[:question])
      @ci.valid?
    else
      @ci = ChunkInterrogator.new(params[:slug], "")
    end

    respond_to do |format|
      format.html
    end
  end

protected

  def get_author
    if params[:slug]
      @author_name = Author.find_by_slug(params[:slug]).display_name
    else
      @author_name = "________"
    end
  end

  def get_photo
    name = params[:slug].nil? ? "nietzsche" : params[:slug]
    @photo = "/images/#{name}.jpg"
  end
end
