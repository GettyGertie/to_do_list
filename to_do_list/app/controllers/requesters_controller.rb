class RequestersController < ApplicationController

  def new
    requester = Requester.new(requester_params)
    if requester.save
      flash[:success] = "request made"
      redirect_to other_todos_path
    else
      redirect_to root_path
    end
  end

  def requested_cards
    requesters = Requester.where(status: "unresponded")
    @requesters = []
    requesters.each do |requester|
      @requesters.push(requester) unless requester.user_id == current_user.id
    end
  end

  def accept_request
    request = Requester.find(params[:request_id])
    request.update_attribute(:status, "accepted")
    flash[:sucess]= "request accepted"
    redirect_to requested_cards_path
  end

  def reject_request
    request = Requester.find(params[:request_id])
    request.update_attribute(:status, "rejected")
    flash[:sucess]= "request rejected"
    redirect_to requested_cards_path
  end

  def requests_accepted_list
    @requests = Requester.where(user_id: current_user.id, status: "accepted")
  end

  private

  def requester_params
  params.permit(:user_id, :card_id)
  end
end
