class InterrogatorController < ApplicationController
  def index
    pars = params[:chunk_interrogator]
    if pars && pars[:question]
      @ci = ChunkInterrogator.new(pars[:slug], pars[:question])
      @ci.valid?
    else
      @ci = ChunkInterrogator.new(pars[:slug], "")
    end

    respond_to do |format|
      format.html
    end
  end
end
