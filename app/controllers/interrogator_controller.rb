class InterrogatorController < ApplicationController
  before_filter :get_author
  before_filter :get_photo
  before_filter :get_title

  def index
    if params && params[:question]
      @ci = ChunkInterrogator.new(params[:slug], params[:question], 
                                  params[:chunk])
      @ci.valid?
    else
      @ci = ChunkInterrogator.new(params[:slug], "")
    end

    respond_to do |format|
      format.html
    end
  end

  def bio
    respond_to do |format|
      format.html
    end
  end

  def root
    @authors = Author.where(:active => true).order("display_name").
      group_by do |a| 
        a.slug == "everybody" 
      end.values.flatten

    respond_to do |format|
      format.html
    end
  end

  def about
    @authors = Author.where(:active => true).order("display_name").
      group_by do |a| 
        a.slug == "everybody" 
      end.values.flatten

    respond_to do |format|
      format.html
    end
  end
protected

  def get_author
    if params[:slug]
      @author = Author.find_by_slug(params[:slug])
      @author_name = @author.display_name
    else
      @author = nil
      @author_name = "________"
    end
  end

  def get_photo
    name = params[:slug].nil? ? "everybody" : params[:slug]
    @photo = "/images/#{name}.jpg"
  end

  def get_title
    text = (params[:question] || "").titlecase
    @title = "Ask #{@author_name}: #{text}?".squeeze("?")
  end
end
