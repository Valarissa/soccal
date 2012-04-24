require 'spec_helper'

describe UsersController do
  
  describe "#index" do
    it "lists all the users" do
      user = Factory(:user)

      get :index
      assigns(:users).should eq([user])
    end
  end

  describe "#show" do
    it "lists the specified user" do
      users = [
        Factory(:user),
        Factory(:user, 
                :username => "testor",
                :email => "testor@test.com")
      ]

      get :show, :id => "testa"
      assigns(:user).should eq(users[0])
    end
  end

end
