class EmailServicesController < ApplicationController
  before_action :set_email_service, only: %i[ show edit update destroy ]

  
  # <!--===================-->
  # <!--to add mailing service-->
  def send_email
    @email_service = EmailService.find(params[:id])
    ApplicationMailer.send_email(@email_service.to, @email_service.subject, @email_service.body).deliver_later
    flash[:success] = 'Email sent!'
    @email_service.update(sent_at: Time.current)
    redirect_to email_services_url
  end
  # <!--===================-->
  
  
  # GET /email_services or /email_services.json
  def index
    #puts ("------------------------------")
    @email_services = EmailService.all
    #puts("In index controller");
    
    # <!--===================-->
    # <!--to filter emails based on their sent_at status-->
    @sent_emails = EmailService.where.not(sent_at: nil) # Get all sent emails
    @unsent_emails = EmailService.where(sent_at: nil) # Get all unsent emails
    # <!--===================-->
  end

  # GET /email_services/1 or /email_services/1.json
  def show
    #puts("****************")
    #puts("reached here")
    @email_service = EmailService.find(params[:id])
    #puts(@email_service)
    #puts("****************")
    render :show 
  end

  # GET /email_services/new
  def new
    @email_service = EmailService.new
    
    # <!--===================-->
    # <!--to have access to another model-->
    @events = Event.all
    # <!--===================-->
  end

  # GET /email_services/1/edit
  def edit
  end

  # POST /email_services or /email_services.json
  def create
    @email_service = EmailService.new(email_service_params)

    respond_to do |format|
      if @email_service.save
        format.html { redirect_to email_service_url(@email_service), notice: "Email service was successfully created." }
        format.json { render :show, status: :created, location: @email_service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @email_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /email_services/1 or /email_services/1.json
  def update
    respond_to do |format|
      if @email_service.update(email_service_params)
        format.html { redirect_to email_service_url(@email_service), notice: "Email service was successfully updated." }
        format.json { render :show, status: :ok, location: @email_service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @email_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_services/1 or /email_services/1.json
  def destroy
    @email_service.destroy

    respond_to do |format|
      format.html { redirect_to email_services_url, notice: "Email service was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email_service
      @email_service = EmailService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def email_service_params
      # params.require(:email_service).permit(:to, :subject, :body)
      # params.require(:email_service).permit(:to, :subject, :body, :sent_at, :committed_at)
      # params.require(:email_service).permit(:to, :subject, :body, :sent_at, :committed_at, :event_id)
      params.require(:email_service).permit(:to, :subject, :body, :sent_at, :committed_at, :event_id, :guest_id)
    end
end
