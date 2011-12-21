class NavbarController < ApplicationController

def submitform
    if request.post?
        ContactMailer.email_form(params[:submitter][:name], params[:submitter][:email], params[:submitter][:phone], params[:message]).deliver
        redirect_to root_url, :notice => "Is Great Success!"
    end
end

end
