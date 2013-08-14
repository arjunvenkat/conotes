class TagAssociationsController < ApplicationController
  before_action :set_tag_association, only: [:show, :edit, :update, :destroy]

  # GET /tag_associations
  # GET /tag_associations.json
  def index
    @tag_associations = TagAssociation.all
  end

  # GET /tag_associations/1
  # GET /tag_associations/1.json
  def show
  end

  # GET /tag_associations/new
  def new
    @tag_association = TagAssociation.new
  end

  # GET /tag_associations/1/edit
  def edit
  end

  # POST /tag_associations
  # POST /tag_associations.json
  def create
    @tag_association = TagAssociation.new(tag_association_params)

    respond_to do |format|
      if @tag_association.save
        format.html { redirect_to @tag_association, notice: 'Tag association was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tag_association }
      else
        format.html { render action: 'new' }
        format.json { render json: @tag_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tag_associations/1
  # PATCH/PUT /tag_associations/1.json
  def update
    respond_to do |format|
      if @tag_association.update(tag_association_params)
        format.html { redirect_to @tag_association, notice: 'Tag association was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tag_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_associations/1
  # DELETE /tag_associations/1.json
  def destroy
    @tag_association.destroy
    respond_to do |format|
      format.html { redirect_to tag_associations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag_association
      @tag_association = TagAssociation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_association_params
      params.require(:tag_association).permit(:note_id, :tag_id)
    end
end
