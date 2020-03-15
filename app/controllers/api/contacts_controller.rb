class Api::ContactsController < ApplicationController
  def show
    @contact = Contact.find_by(id: params["id"])
    render "show.json.jb"
  end

  def create
    @contact = Contact.new(
      first_name: params["first_name"],
      last_name: params["last_name"],
      email: params["email"],
      phone_number: params["phone_number"],
      middle_name: params["middle_name"],
      bio: params["bio"],
      user_id: current_user.id,
    )
    if @contact.save
      render "show.json.jb"
    else
      render json: { message: @contact.errors.full_messages }
    end
  end

  def index
    if current_user
      @contacts = []
      @contacts << Contact.find_by(user_id: current_user.id)
      render "index.json.jb"
    else
      render json: { message: "User not logged in" }
    end
  end

  def update
    @contact = Contact.find_by(id: params["id"])
    @contact.first_name = params["first_name"] || @contact.first_name
    @contact.last_name = params["last_name"] || @contact.last_name
    @contact.email = params["email"] || @contact.email
    @contact.phone_number = params["phone_number"] || @contact.phone_number
    @contact.middle_name = params["middle_name"] || @contact.middle_name
    @contact.bio = params["bio"] || @contact.bio
    if @contact.save
      render "show.json.jb"
    else
      render json: { message: @contact.errors.full_messages }
    end
  end

  def destroy
    contact = Contact.find_by(id: params["id"])
    contact.destroy
    render json: { message: "Contact successfully destroyed." }
  end
end
