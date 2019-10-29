class ApplicationController < ActionController::Base
before_action :authenticate_user!
before_action :set_locale

   def after_sign_in(resource)
     if resource.role == "associate"
       redirect_to 'associate#index'
# binding.pry
       # associate_path (or whatever the name of the path is in your routes)
     else resource.role == "manager"
        redirect_to 'associate#edit'

   end

end
private
def set_locale
  I18n.locale = params[:locale] || I18n.default_locale
  # current_user.locale
end
def default_url_options(options = {})

  { locale: I18n.locale }.merge  options

end

end
