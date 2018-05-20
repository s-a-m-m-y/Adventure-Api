class AdventureOptionsController < ApplicationController
  before_action :set_adventure_option, only: [:show, :edit, :update, :destroy]

  # GET /adventure_options
  # GET /adventure_options.json
  def index
    @adventure_options = AdventureOption.all
  end

  # GET /adventure_options/1
  # GET /adventure_options/1.json
  def show
    @adventure = Adventure.find(@adventure_option.adventure_id)
  end

  # GET /adventure_options/new
  def new
    @adventure_option = AdventureOption.new
  end

  # GET /adventure_options/1/edit
  def edit
  end

  # POST /adventure_options
  # POST /adventure_options.json
  def create
    @adventure_option = AdventureOption.new(adventure_option_params)

    respond_to do |format|
      if @adventure_option.save
        format.html { redirect_to @adventure_option, notice: 'Adventure option was successfully created.' }
        format.json { render :show, status: :created, location: @adventure_option }
      else
        format.html { render :new }
        format.json { render json: @adventure_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adventure_options/1
  # PATCH/PUT /adventure_options/1.json
  def update
    respond_to do |format|
      if @adventure_option.update(adventure_option_params)
        format.html { redirect_to @adventure_option, notice: 'Adventure option was successfully updated.' }
        format.json { render :show, status: :ok, location: @adventure_option }
      else
        format.html { render :edit }
        format.json { render json: @adventure_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adventure_options/1
  # DELETE /adventure_options/1.json
  def destroy
    @adventure_option.destroy
    respond_to do |format|
      format.html { redirect_to adventure_options_url, notice: 'Adventure option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adventure_option
      @adventure_option = AdventureOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adventure_option_params
      params.require(:adventure_option).permit(:option_text, :adventure_id)
    end
end
