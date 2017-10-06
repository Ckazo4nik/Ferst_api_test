class KittensController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @kittens}
      format.json { render json: @kittens}
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @kitten = Kitten.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @kitten = Kitten.new(project_params)

    respond_to do |format|
      if @kitten.save
        format.html { redirect_to @kitten, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @kitten }
      else
        format.html { render :new }
        format.json { render json: @kitten.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @kitten.update(project_params)
        format.html { redirect_to @kitten, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @kitten }
      else
        format.html { render :edit }
        format.json { render json: @kitten.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @kitten.destroy
    respond_to do |format|
      format.html { redirect_to kittens_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @kitten = Kitten.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
