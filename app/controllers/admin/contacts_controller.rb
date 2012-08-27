class Admin::ContactsController < Admin::AdminController
  def show
    @contact = Contact.first
  end

  def update
    @contact = Contact.find(params[:format])

    if @contact.update_attributes(params[:contact])
      redirect_to :back, notice: 'contacts updated'
    else
      @errors = @contact.errors.full_messages.join('. ')
      redirect_to :back, alert: "#{@errors}"
    end
  end
end
