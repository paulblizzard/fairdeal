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

    #set status and category
    @dealing.status = "In Progress"
    @dealing.category = "Unknown"

    respond_to do |format|
      if @dealing.save
        logger.info "Dealing was successfully created."

        #this is ugly as hell
        @dealing.factors.create( title: "Factor 1", content: "Purpose of the dealing", factor_type: "FACTOR1" ).questions.create( title: "Question 1", content: "Describe the purpose of the dealing? <br>i.e. research, private study, education, parody, satire, criticism, review or news reporting), including whether it is commercial.", question_type: "QUESTION1" )
        @dealing.factors.create( title: "Factor 2", content: "Character of the dealing.", factor_type: "FACTOR2" ).questions.create( title: "Question 2", content: "What is the character of the dealing?    <br>I.e. Are the copies destroyed after?  What is the scope of the distribution?", question_type: "QUESTION2" )
        @dealing.factors.create( title: "Factor 3", content: "Amount of the dealing.", factor_type: "FACTOR3" ).questions.create( title: "Question 3", content: "What is the amount of the dealing?  <br>Does the amount fall under one of the following criteria: <br>-up to 10 percent of a copyright-protected work (including a literary work, musical score, sound recording, and an audiovisual work), <br>-one chapter from a book, <br>-a single article from a periodical, <br>-an entire artistic work (including a painting, print, photograph, diagram, drawing, map, chart, and plan) from a copyright-protected work containing other artistic works, <br>-an entire newspaper article or page, <br>-an entire single poem or musical score from a copyright-protected work containing other poems or musical scores, <br>-an entire entry from an encyclopedia, annotated bibliography, dictionary or similar reference work, provided that in each case you copy no more of the work than you need to in order to achieve the allowable purpose. ", question_type: "QUESTION3" )
        @dealing.factors.create( title: "Factor 4", content: "Alternatives to the dealing.", factor_type: "FACTOR4" ).questions.create( title: "Question 4", content: "What are the alternatives to the dealing?", question_type: "QUESTION4" )
        @dealing.factors.create( title: "Factor 5", content: "Nature of the work.", factor_type: "FACTOR5" ).questions.create( title: "Question 5", content: "What is the nature of the work?", question_type: "QUESTION5" )
        @dealing.factors.create( title: "Factor 6", content: "Effect of the dealing on the work.", factor_type: "FACTOR6" ).questions.create( title: "Question 6", content: "What is the effect of the dealing on the work?", question_type: "QUESTION6" )

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
