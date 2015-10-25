class ScrobblesController < ApplicationController
  before_action :set_scrobble, only: [:show, :edit, :update, :destroy]

  # GET /scrobbles
  # GET /scrobbles.json
  def index
    @scrobbles = Scrobble.all
  end

  # GET /scrobbles/1
  # GET /scrobbles/1.json
  def show
  end

  # GET /scrobbles/new
  def new
    @scrobble = Scrobble.new
  end

  # GET /scrobbles/1/edit
  def edit
  end

  # POST /scrobbles
  # POST /scrobbles.json
  def create
    @scrobble = Scrobble.new(scrobble_params)

    respond_to do |format|
      if @scrobble.save
        format.html { redirect_to @scrobble, notice: 'Scrobble was successfully created.' }
        format.json { render :show, status: :created, location: @scrobble }
      else
        format.html { render :new }
        format.json { render json: @scrobble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scrobbles/1
  # PATCH/PUT /scrobbles/1.json
  def update
    respond_to do |format|
      if @scrobble.update(scrobble_params)
        format.html { redirect_to @scrobble, notice: 'Scrobble was successfully updated.' }
        format.json { render :show, status: :ok, location: @scrobble }
      else
        format.html { render :edit }
        format.json { render json: @scrobble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scrobbles/1
  # DELETE /scrobbles/1.json
  def destroy
    @scrobble.destroy
    respond_to do |format|
      format.html { redirect_to scrobbles_url, notice: 'Scrobble was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_all
    byebug
    Scrobble.delete_all
    respond_to do |format|
      format.html {redirect_to scrobbles_url, notice: 'All scrobbles were successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  def import_file
    # TODO: don't import if there is no file. maybe put in the view and not even accept button press
    # byebug
    Scrobble.import(params[:file])
    redirect_to scrobbles_path, notice: 'Scrobbles were successfully imported.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scrobble
      @scrobble = Scrobble.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scrobble_params
      params.require(:scrobble).permit(:time, :trackname, :artistname, :albumname, :application)
    end
end
