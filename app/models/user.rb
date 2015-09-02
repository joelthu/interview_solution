class User < ActiveRecord::Base
  validates_format_of :email, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, :multiline => true
  validates_format_of :social_security_number, :with => /^(?!219099999|078051120)(?!666|000|9\d{2})\d{3}(?!00)\d{2}(?!0{4})\d{4}$/i, :multiline => true
  after_save :write_json

  def write_json
    users_json = []
    User.all.each do |user|
      user_json = {
        "firstname" => user.first_name,
        "lastname" => user.last_name,
        "email" => user.email,
        "social_security_number" => user.social_security_number
      }
      users_json << user_json
    end
    File.open("public/user.json", "w") do |f|
      f.write(users_json.to_json)
    end
  end  

end