class FollowRequestsController < ApplicationController
  before_action :set_follow_request, only: %i[ show edit update destroy ]
  before_action :authorize_follow_request

  def index
    @follow_requests = FollowRequest.all
  end

  def show
  end

  def new
    @follow_request = FollowRequest.new
  end

  def edit
  end

  def create
    @follow_request = FollowRequest.new(follow_request_params)
    authorize @follow_request
    @follow_request.sender = current_user
    respond_to do |format|
      if @follow_request.save
        format.html { redirect_back fallback_location: root_url, notice: "Follow request was successfully created." }
        format.json { render :show, status: :created, location: @follow_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @follow_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @follow_request.update(follow_request_params)
        format.html { redirect_back fallback_location: root_url, notice: "Follow request was successfully updated." }
        format.json { render :show, status: :ok, location: @follow_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @follow_request.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @follow_request.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_url, notice: "Follow request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_follow_request
      @follow_request = FollowRequest.find(params[:id])
    end

    def follow_request_params
      params.require(:follow_request).permit(:recipient_id, :sender_id, :status)
    end

    def authorize_follow_request
      authorize @follow_request || FollowRequest
    end

end
