class NavbarController < ApplicationController

    def submitform
        reg = Regexp.new("^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$")

        @submitter = params[:submitter]
        @message = params[:message]
        
        if request.post?
            if params[:submitter][:name] && !params[:submitter][:name].blank?
                if params[:submitter][:email] && !params[:submitter][:email].blank? && reg.match(params[:submitter][:email])
                    if params[:message] && !params[:message].blank?
                        ContactMailer.email_form(params[:submitter][:name], params[:submitter][:email], params[:submitter][:phone], params[:message]).deliver
                        flash[:notice] = "Hey, thanks! I've got your email and will respond as soon as possible!"
                    else
                        flash[:error] = "Problem with the form submission: You didn't leave a message!"
                    end
                else
                    flash[:error] = "Problem with the form submission: Email address empty or not valid"
                end
            else
                flash[:error] = "Problem with the form submission: Name field is empty."
            end
        else
            flash[:error] = "Please stop that. That's mean"
        end
        redirect_to root_url
    end

    def error
        flash[:error] = "Sorry, that page doesn't exist. Feel free to hang out at this one, though!"
        redirect_to root_url
    end


end
