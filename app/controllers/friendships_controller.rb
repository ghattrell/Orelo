class FriendshipsController < ApplicationController
  before_filter :set_friendship, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @friendships = Friendship.all
    respond_with(@friendships)
  end

  def show
    respond_with(@friendship)
  end


  def new
    @friendship = Friendship.new
    respond_with(@friendship)
  end

  def edit
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def update
    @friendship.update_attributes(params[:friendship])
    respond_with(@friendship)
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end

  private
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end
end
