class Contact < ApplicationRecord
  def friendly_updated_at
    updated_at.strftime("%l:%M%P %B %e, %Y")
  end

  def full_name
    full = ""
    full += "#{first_name} #{last_name}"
  end
end
