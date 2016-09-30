class DealingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dealing, only: [:show, :edit, :update, :destroy]

  # GET /dealings
  # GET /dealings.json
  def index
    @dealings = Dealing.all
  end

  # GET /dealings/1
  # GET /dealings/1.json
  def show
  end

  # GET /dealings/new
  def new
    @dealing = Dealing.new
  end

  # GET /dealings/1/edit
  def edit
  end

  # POST /dealings
  # POST /dealings.json
  def create
    @dealing = Dealing.new(dealing_params)

    respond_to do |format|
      if @dealing.save
        format.html { redirect_to @dealing, notice: 'Dealing was successfully created.' }
        format.json { render :show, status: :created, location: @dealing }
      else
        format.html { render :new }
        format.json { render json: @dealing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dealings/1
  # PATCH/PUT /dealings/1.json
  def update
    respond_to do |format|
      if @dealing.update(dealing_params)
        format.html { redirect_to @dealing, notice: 'Dealing was successfully updated.' }
        format.json { render :show, status: :ok, location: @dealing }
      else
        format.html { render :edit }
        format.json { render json: @dealing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dealings/1
  # DELETE /dealings/1.json
  def destroy
    @dealing.destroy
    respond_to do |format|
      format.html { redirect_to dealings_url, notice: 'Dealing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dealing
      @dealing = Dealing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dealing_params
      params.require(:dealing).permit(:due_date)
    end
end
