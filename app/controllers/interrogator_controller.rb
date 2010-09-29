class InterrogatorController < ApplicationController
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
end
