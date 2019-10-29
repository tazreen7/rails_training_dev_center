class AssociatesController < ApplicationController
  before_action:authenticate_user!


def index

  userPresent = current_user[:email]
  userPresentt = current_user[:role]
  # @associate = @current_user.associate.order("position")
  # @associate = Associate.new(:user => @current_user)
   # @user= current_user=Associate.current_user[:role]
    # @associates=Associate.current_user[:role].all
    # <%=unless current_user?(User.role) %>
  # if @associates.user = @current_user
  @associates=current_user[:role]
    if current_user[:role]=="associate" || current_user[:role]=="manager"
       @associates= Associate.all.paginate(page: params[:page], per_page: 3)
       # @associates = @associates.filter
end
end

# def require_admin
#     if current_user && current_user.is_admin?
#       true
#     else
#       flash[:notice] = "You are not authorized to set holidays"
#       redirect_to new_user_session_path
#     end
#   end

#   def show
#     #displays all the details submitted by the form
#     # Rails.logger.debug ""
#     @array=params[:associate]
#     @associate = Associate.find_by_cerner_id(current_user[:cerner_id])
#     @associate= Associate.all
#
# end
def edit
   # @associate = current_user
     @associate =  Associate.find(params[:id])

end
def update
# binding.pry
# @associate = current_user
#      @associate = Associate.pluck(:id)
#      # @associate.user_id = current_user.id
# @id=Associate.pluck(:id)
 @associate = Associate.find_by_id(current_user[:id])
# @associate.update_attributes(params[:associate])
if @associate.update_attributes(associate_params)
 @associate.save
    flash[:notice]= "successfully updated"
      redirect_to associates_path(@associate)
    else
      puts "failed"
    end
end
def destroy
@associate = Associate.find(params[:id])
@associate.destroy
flash[:notice]= "successfully deleted"
  redirect_to associate_path(@associate)
end
def new
  #passing params of associate
   @associate= params || {}
  @associate=Associate.new()
end
def create
   #creates the object of associate
   @associate=current_user.associates.new(associate_params)
            #saves the object to the database
          if  @associate.save
        flash[:notice]= "Request generated successfully"
                  # redirect_to :action => :edit, :id => @associate.id
    # redirect_to :action => :show, :id => @associate.id
    else
      render 'new'
   end
# def show
#   @associate=Associate.find(params[@associate.id])
# end


  end
def associate_params
             #passing params to the associate
  params.require(:associate).permit( :leave_approval, :start_date, :end_date, :type_of_request, :cerner_id, :email)

           end
end
