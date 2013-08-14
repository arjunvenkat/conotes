class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    if params[:type] == "note"
      @note = Note.find_by_id(params[:id])
      @vote = @note.votes.new

      respond_to do |format|
        if @vote.save
          @note.num_votes += 1
          @note.save
          format.html { redirect_to notes_url, notice: 'Vote was successfully created.' }
          format.json { render action: 'show', status: :created, location: @vote }
        else
          format.html { render action: 'new' }
          format.json { render json: @vote.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    voteable = @vote.voteable
    @vote.destroy
    voteable.num_votes -= 1
    voteable.save
    respond_to do |format|
      format.html { redirect_to votes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:voteable_id, :voteable_type)
    end
end
