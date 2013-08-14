class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    all_associated_tags = @tag.notes.map {|note| note.tags}
    if all_associated_tags.present?
      @associated_tags = all_associated_tags.flatten.uniq
      #removes itself from the list
      @associated_tags.delete(@tag)

    end
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tag }
      else
        format.html { render action: 'new' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url }
      format.json { head :no_content }
    end
  end

  def search
    if !params[:tag_id] && !params[:searched_tag_ids]
      @searched_tag_ids = []
    elsif params[:tag_id] && params[:searched_tag_ids]
      @searched_tag_ids = params[:searched_tag_ids].to_a
      @searched_tag_ids << params[:tag_id]
    elsif params[:tag_id] && !params[:searched_tag_ids]
      @searched_tag_ids = []
      @searched_tag_ids << params[:tag_id]
    else
      @searched_tag_ids = params[:searched_tag_ids].to_a
    end

    @searched_tags = @searched_tag_ids.map {|tag_id| Tag.find(tag_id.to_i)}

    # This next section of code pulls out any notes that are associated with ALL of the @searched_tags

    # goes through each current tag and pulls out the associated notes
    notes_per_tag = []
    @searched_tags.each do |ct|
      notes_per_tag << ct.notes
    end
    @leftover_tags = Tag.all - @searched_tags
    # only saves notes that are common to each tag, that is, notes that exist in every element of the notes_per_tag array
    @searched_notes = notes_per_tag[0]
    notes_per_tag.each do |note_array|
      @searched_notes = @searched_notes & note_array
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name)
    end
end
