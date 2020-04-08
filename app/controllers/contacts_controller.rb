class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @contact = Contact.new(
      first_name: params["first_name"],
      middle_name: params["middle_name"],
      last_name: params["last_name"],
      phone_number: params["phone_number"],
      email: params["email"],
      bio: params["bio"],
      user_id: 1,
    )
    if @contact.save
      redirect_to "/contacts/#{@contact.id}"
    else
      render json: { error: @contact.errors.full_messages }
    end
  end

  def show
    @contact = Contact.find_by(id: params["id"])
    render "show.html.erb"
  end

  def edit
    @contact = Contact.find_by(id: params["id"])
    render "edit.html.erb"
  end

  def update
    @contact = Contact.find_by(id: params["id"])
    @contact.first_name = params["first_name"]
    @contact.middle_name = params["middle_name"]
    @contact.last_name = params["last_name"]
    @contact.phone_number = params["phone_number"]
    @contact.email = params["email"]
    @contact.bio = params["bio"]
    @contact.user_id = 1
    if @contact.save
      redirect_to "/contacts/#{@contact.id}"
    else
      render json: { errors: @contact.errors.full_messages }
    end
  end
end
