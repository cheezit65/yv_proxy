class MessagesController < InheritedResources::Base 
   
  def create
    EmailPage.email_friend(params[:user1][:email1],params[:user2][:email2], params[:id], params[:yearling], params[:hip]).deliver
    flash[:notice] = "Email Sent to your friend at #{params[:user2][:email2]} "
    redirect_to :back
  end

  def new
    @sale = Sale.find(params[:sale])
    ClientReportMailer.email_client(params[:email1], params[:farm], params[:sale]).deliver
    redirect_to :back
  end


end

