class User < ActiveRecord::Base
    # validates_presence_of :name
    # Define the other validations here
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    
    # title attribute is one of 'Mrs', 'Ms', or 'Mr'
    validates :title, inclusion: { in: %w(Mrs Ms Mr)}

    # age attributes is and integers greater than 0
    validates :age, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
    
    # phone_number attributes starts with '+1' and is followed by 10 digits if not met the error message should be "sorry, only us phone numbers required"
    validates :phone_number, format: { with: /^\+1[0-9]{10}$/g, message: 'Sorry, only US phone numbers are allowed' }

    # password attribute has a length between 6 and 20 chars
    validates :password, length: { minimum: 6, maximum: 20 }, confirmation: true

    # passwor_confirmation attribute is the same as password
    validates :password_confirmation, presence: true

  end
  