class AdventureOptionResultsController < ApplicationController
  before_action :set_adventure_option_result, only: [:show, :edit, :update, :destroy]

  # GET /adventure_option_results
  # GET /adventure_option_results.json
  def index
    @adventure_option_results = AdventureOptionResult.all
  end

  # GET /adventure_option_results/1
  # GET /adventure_option_results/1.json
  def show
  end

  # GET /adventure_option_results/new
  def new
    @adventure_option_result = AdventureOptionResult.new
  end

  # GET /adventure_option_results/1/edit
  def edit
  end

  # POST /adventure_option_results
  # POST /adventure_option_results.json
  def create
    @adventure_option_result = AdventureOptionResult.new(adventure_option_result_params)

    respond_to do |format|
      if @adventure_option_result.save
        format.html { redirect_to @adventure_option_result, notice: 'Adventure option result was successfully created.' }
        format.json { render :show, status: :created, location: @adventure_option_result }
      else
        format.html { render :new }
        format.json { render json: @adventure_option_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adventure_option_results/1
  # PATCH/PUT /adventure_option_results/1.json
  def update
    respond_to do |format|
      if @adventure_option_result.update(adventure_option_result_params)
        format.html { redirect_to @adventure_option_result, notice: 'Adventure option result was successfully updated.' }
        format.json { render :show, status: :ok, location: @adventure_option_result }
      else
        format.html { render :edit }
        format.json { render json: @adventure_option_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adventure_option_results/1
  # DELETE /adventure_option_results/1.json
  def destroy
    @adventure_option_result.destroy
    respond_to do |format|
      format.html { redirect_to adventure_option_results_url, notice: 'Adventure option result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adventure_option_result
      begin
        @adventure_option_result = AdventureOptionResult.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        @adventure_option_result = AdventureOptionResult.new
        @adventure_option_result.reward = "Nothin happens"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adventure_option_result_params
      params.require(:adventure_option_result).permit(:reward, :adventure_option_id)
    end
end
