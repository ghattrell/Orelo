class CallsController < ApplicationController
  before_filter :set_call, only: [:show, :edit, :update, :destroy]
  def index
   @calls = current_user.received_calls.where("created_at > :since", {since: Time.parse(params[:since]) + 1.second })
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @calls.to_json(:include => :user )}
    end
  end

  def create
    room = User.create_unique_token
    @call = Call.create(user_id: current_user.id, :user2_id => params[:user2_id], room: room)
    if @call.save
      flash[:notice] = "Calling #{(User.find(params[:user2_id])).firstname}."
      redirect_to "/chat##{room}"
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end

  end

  def destroy
    @call = current_user.calls.find(params[:id])
    @call.destroy
    flash[:notice] = "Hanging up"
    redirect_to current_user
  end
end