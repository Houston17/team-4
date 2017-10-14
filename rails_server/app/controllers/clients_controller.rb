class ClientsController < ApplicationController
  before_action :set_client, only: [:edit, :update, :destroy]

  def index
    @featured_clients = Client.where(private: false, featured: true).limit(3)
  end

  # GET /clients
  # GET /clients.json
  def edit_list
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    # If the user isn't signed in, don't show private client stories
    if !user_signed_in?
      @client = Client.where(id: params[:id], private: false).first
    else
      @client = Client.find_by_id(params[:id])
    end

    if !@client 
      raise ActionController::RoutingError.new('Client story not Found')
    end      

    # Order the client's timeline events by date and group by month/year combo
    @events =  @client.events.order(:date).group_by { |e| e.date.beginning_of_month }
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to clients_edit_list_url, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :bio, :intro, :embed_html, :featured, :private, :picture_url)
    end
end
