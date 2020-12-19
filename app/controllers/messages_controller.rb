class MessagesController < InheritedResources::Base 
   
  def create
    if verify_recaptcha
      EmailPage.email_friend(params[:user1][:email1],params[:user2][:email2], params[:id], params[:yearling], params[:hip]).deliver
      flash[:notice] = "Email Sent to your friend at #{params[:user2][:email2]} "
      redirect_back(fallback_location: root_path)

    else
      flash[:notice] = "Captcha checkbox not checked. Try again."
      redirect_back(fallback_location: root_path)

    end
  end

  def new
    @sale = Sale.find(params[:sale])
    ClientReportMailer.email_client(params[:email1], params[:farm], params[:sale]).deliver
    redirect_back(fallback_location: root_path)

  end


end

