class DealingsController < ApplicationController
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

    #add all factors
    Factor.all.each do |f| 
      @dealing.factors << f
    end

    #set status and category
    @dealing.status = "In Progress"
    @dealing.category = "Unknown"

    respond_to do |format|
      if @dealing.save
        logger.info "Dealing was successfully created."
        format.html { redirect_to edit_dealing_path(@dealing), notice: 'Dealing was successfully created.' }
        format.json { render :show, status: :created, location: @dealing }
      else
        logger.error "Error: Dealing creation failed #{@dealing.errors}."
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
        logger.info "Dealing was successfully updated."

        # send request to predictionio server if a user marks a dealing as complete
        if @dealing.status.includes? "Complete" && @dealing.status_changed?
          logger.info "User changed status to Complete, sending query to predictionio."



        end

        # send training data to predictionio server if an admin changes the category
        if @dealing.category_changed?
          logger.info "Change in category detected, sending event to predictionio server."

          # foreach factor
            # foreach question
              #send the answer event for training
          event_client = PredictionIO::EventClient.new(ENV['PIO_1_KEY'], ENV['PIO_EVENT_SERVER_URL'], Integer(ENV['PIO_THREADS']))

          #event_client.create_event('answer', 'content', @,
          #                'eventTime' => Time.now.to_formatted_s(:iso8601),
          #                'properties' => { 'prop1' => 1,
          #                                  'prop2' => 'value2',
          #                                  'prop3' => [1, 2, 3],
          #                                  'prop4' => true,
          #                                  'prop5' => %w(a b c),
          #                                  'prop6' => 4.56 })

        end

        logger.info "Dealing was successfully updated."
        format.html { redirect_to @dealing, notice: 'Dealing was successfully updated.' }
        format.json { render :show, status: :ok, location: @dealing }
      else
        logger.error "Error: Dealing update failed #{@dealing.errors}."
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
