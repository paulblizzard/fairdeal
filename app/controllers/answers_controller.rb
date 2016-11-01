class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  before_action :set_dealing, only: [:create, :update]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)

    logger.info "Querying the PredictionIO server at "+ENV["PIO_#{@answer.question.question_type}_ENGINE"]

    engine_client = PredictionIO::EngineClient.new(ENV["PIO_#{@answer.question.question_type}_ENGINE"])
    response = JSON.parse engine_client.send_query(text: @answer.content).to_json
    
    @answer.confidence = response["confidence"]
    @answer.category = response["category"]

    logger.info "Response from PredictionIO server -> category:"+@answer.category+", confidence:"+@answer.confidence.to_s

    respond_to do |format|
      if @answer.save
        logger.info "Answer was successfully created."
        format.html { redirect_to @dealing, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }

      else
        logger.error "Error: Answer creation failed #{@answer.errors}."
        format.html { redirect_to @dealing }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update

    logger.info "Querying the PredictionIO server at "+ENV["PIO_#{@answer.question.question_type}_ENGINE"]

    engine_client = PredictionIO::EngineClient.new(ENV["PIO_#{@answer.question.question_type}_ENGINE"])
    response = JSON.parse engine_client.send_query(text: @answer.content).to_json
    
    @answer.confidence = response["confidence"]
    @answer.category = response["category"]

    logger.info "Response from PredictionIO server -> category:"+@answer.category+", confidence:"+@answer.confidence.to_s

    respond_to do |format|
      if @answer.update(answer_params)
        logger.info "Answer was successfully updated."

        format.html { redirect_to @dealing, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        logger.error "Error: Answer update failed #{@answer.errors}."
        format.html { redirect_to @dealing }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def set_dealing
      @dealing = Dealing.find(params[:answer][:dealing_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:title, :content, :question_id, :dealing_id)
    end
end
