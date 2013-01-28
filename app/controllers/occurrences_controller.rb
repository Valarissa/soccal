class OccurrencesController < ApplicationController
  # GET /occurrences
  # GET /occurrences.json
  def index
    @occurrences = Occurrence.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @occurrences }
    end
  end

  # GET /occurrences/1
  # GET /occurrences/1.json
  def show
    @occurrence = Occurrence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @occurrence }
    end
  end

  # GET /occurrences/new
  # GET /occurrences/new.json
  def new
    @occurrence = Occurrence.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @occurrence }
    end
  end

  # GET /occurrences/1/edit
  def edit
    @occurrence = Occurrence.find(params[:id])
  end

  # POST /occurrences
  # POST /occurrences.json
  def create
    @occurrence = Occurrence.new(params[:occurrence])

    respond_to do |format|
      if @occurrence.save
        format.html { redirect_to @occurrence, notice: 'Occurrence was successfully created.' }
        format.json { render json: @occurrence, status: :created, location: @occurrence }
      else
        format.html { render action: "new" }
        format.json { render json: @occurrence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /occurrences/1
  # PUT /occurrences/1.json
  def update
    @occurrence = Occurrence.find(params[:id])

    respond_to do |format|
      if @occurrence.update_attributes(params[:occurrence])
        format.html { redirect_to @occurrence, notice: 'Occurrence was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @occurrence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /occurrences/1
  # DELETE /occurrences/1.json
  def destroy
    @occurrence = Occurrence.find(params[:id])
    @occurrence.destroy

    respond_to do |format|
      format.html { redirect_to occurrences_url }
      format.json { head :no_content }
    end
  end
end
