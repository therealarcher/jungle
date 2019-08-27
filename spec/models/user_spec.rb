require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do
    it 'is valid if name, email, and if password and password confirmation match' do
      @user = User.new
      @user.name = 'Joe'
      @user.email = 'joe@gmail.com'
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      expect(@user).to be_valid
    end

    it 'is not valid if password and password confirmation not equal' do
      @user = User.new
      @user.name = 'Joe'
      @user.email = 'joe@gmail.com'
      @user.password = 'abc123'
      @user.password_confirmation = '123abc'
      expect(@user).to_not be_valid
    end

    it 'is not valid if email is missing' do
      @user = User.new
      @user.name = 'Joe'
      # @user.email = 'joe@gmail.com'
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      expect(@user).to_not be_valid
    end
    
    it 'is not valid if name is missing' do
      @user = User.new
      # @user.name = 'Joe'
      @user.email = 'joe@gmail.com'
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      expect(@user).to_not be_valid
    end

    it 'is not valid if password is not minimum length of 5 characters' do
      @user = User.new
      @user.name = 'Joe'
      @user.email = 'joe@gmail.com'
      @user.password = 'abc'
      @user.password_confirmation = 'abc'
      expect(@user).to_not be_valid
    end
  end
  
  describe '.authenticate_with_credentials' do
    it 'should pass with valid credentials' do
      @user = User.new
      @user.name = 'Joe'
      @user.email = 'joe@gmail.com'
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      @user.save
      # expect(@user).to be_valid
      expect(User.authenticate_with_credentials('joe@gmail.com', 'abc123')).to_not be_nil
    end
    
    it 'should pass with email containing whitespace' do
      @user = User.new
      @user.name = 'Joe'
      @user.email = 'joe@gmail.com'
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      @user.save
      # expect(@user).to be_valid
      expect(User.authenticate_with_credentials('    joe@gmail.com   ', 'abc123')).to_not be_nil
    end
    
    it 'should pass with email containing whitespace' do
      @user = User.new
      @user.name = 'Joe'
      @user.email = 'joe@gmail.com'
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      @user.save
      # expect(@user).to be_valid
      expect(User.authenticate_with_credentials('    joe@gmail.com   ', 'abc123')).to_not be_nil
    end
    
    it 'should pass with email containing upper case characters' do
      @user = User.new
      @user.name = 'Joe'
      @user.email = 'joe@gmail.com'
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      @user.save
      # expect(@user).to be_valid
      expect(User.authenticate_with_credentials('JOE@gmAIL.Com   ', 'abc123')).to_not be_nil
    end
  end
end
