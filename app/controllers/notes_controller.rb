class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.order('num_votes DESC')


  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
    recent_notes = Note.order('created_at DESC').limit(5)
    @recent_tags = recent_notes.map {|note| note.tags}.flatten.uniq
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    respond_to do |format|
      if @note.save
        params['tags'].try(:each) do |tag_array|
          TagAssociation.create(tag_id: tag_array[0], note_id: @note.id)
        end
        if params['new_tags'].present?
          tag_list = params['new_tags'].split(',')
          tag_list.each do |tag_string|
            tag_name = tag_string.strip
            tag = Tag.find_by_name(tag_name)
            tag = Tag.create(name: tag_name) if !tag
            TagAssociation.create(tag_id: tag.id, note_id: @note.id)
          end
        end

        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render action: 'show', status: :created, location: @note }
      else
        format.html { render action: 'new' }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:contents)
    end
end
