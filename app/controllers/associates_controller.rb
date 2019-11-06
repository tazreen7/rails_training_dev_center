class AssociatesController < ApplicationController
  before_action:authenticate_user!

  def new
    #create new associate
    @associate= params || {}
    @associate=Associate.new()
  end

  def index
    #display the data in the UI depending on condition
    if current_user[:role]=="associate"
      @associates = current_user.associates.paginate(page: params[:page], per_page: 3)
    elsif current_user[:role]=="manager"
      @associates = current_user.associates.paginate(page: params[:page], per_page: 3)
      @associates_to_approve = Associate.where(user: current_user.subordinates).paginate(page: params[:page], per_page: 3)
    end
    render 'index'
  end

  def edit
    #edit the details
    @associate = Associate.find(params[:id])
  end

  def update
    #update the previous data with new set of data
    @associate = Associate.find_by_id(params[:id])
    if @associate.update_attributes(associate_params)
      flash[:notice]= "successfully updated"
      redirect_to associates_index_path
    else
      flash[:notice]= "operation failed"
    end
  end

  def destroy
    #delete the existing data
    @associate = Associate.find(params[:id])
    @associate.destroy
    flash[:notice]= "successfully deleted"
    redirect_to associate_path(@associate)
  end

  def create
    #create new associate
    @associate=current_user.associates.new(associate_params)
    if  @associate.save
      flash[:notice]= "Request generated successfully"
      redirect_to associates_index_path
    else
      render 'new'
    end
  end

  def accept_request
    #function for accept button
    @associate = Associate.find(params[:id])
    @associate.update_attributes(status: "Approved")
    redirect_to associates_index_path
  end

  def cancel_request
    #function for reject button
    @associate = Associate.find(params[:id])
    @associate.update_attributes(status: "Rejected")
    redirect_to associates_index_path
  end

  def associate_params
    #pass params to the model
    params.require(:associate).permit( :leave_approval, :start_date, :end_date, :type_of_request, :cerner_id, :email)
  end
end
