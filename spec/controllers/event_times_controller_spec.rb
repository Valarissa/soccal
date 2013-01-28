require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe EventTimesController do

  # This should return the minimal set of attributes required to create a valid
  # EventTime. As you add validations to EventTime, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "event_id" => "1" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EventTimesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all event_times as @event_times" do
      event_time = EventTime.create! valid_attributes
      get :index, {}, valid_session
      assigns(:event_times).should eq([event_time])
    end
  end

  describe "GET show" do
    it "assigns the requested event_time as @event_time" do
      event_time = EventTime.create! valid_attributes
      get :show, {:id => event_time.to_param}, valid_session
      assigns(:event_time).should eq(event_time)
    end
  end

  describe "GET new" do
    it "assigns a new event_time as @event_time" do
      get :new, {}, valid_session
      assigns(:event_time).should be_a_new(EventTime)
    end
  end

  describe "GET edit" do
    it "assigns the requested event_time as @event_time" do
      event_time = EventTime.create! valid_attributes
      get :edit, {:id => event_time.to_param}, valid_session
      assigns(:event_time).should eq(event_time)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new EventTime" do
        expect {
          post :create, {:event_time => valid_attributes}, valid_session
        }.to change(EventTime, :count).by(1)
      end

      it "assigns a newly created event_time as @event_time" do
        post :create, {:event_time => valid_attributes}, valid_session
        assigns(:event_time).should be_a(EventTime)
        assigns(:event_time).should be_persisted
      end

      it "redirects to the created event_time" do
        post :create, {:event_time => valid_attributes}, valid_session
        response.should redirect_to(EventTime.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved event_time as @event_time" do
        # Trigger the behavior that occurs when invalid params are submitted
        EventTime.any_instance.stub(:save).and_return(false)
        post :create, {:event_time => { "event_id" => "invalid value" }}, valid_session
        assigns(:event_time).should be_a_new(EventTime)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        EventTime.any_instance.stub(:save).and_return(false)
        post :create, {:event_time => { "event_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested event_time" do
        event_time = EventTime.create! valid_attributes
        # Assuming there are no other event_times in the database, this
        # specifies that the EventTime created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        EventTime.any_instance.should_receive(:update_attributes).with({ "event_id" => "1" })
        put :update, {:id => event_time.to_param, :event_time => { "event_id" => "1" }}, valid_session
      end

      it "assigns the requested event_time as @event_time" do
        event_time = EventTime.create! valid_attributes
        put :update, {:id => event_time.to_param, :event_time => valid_attributes}, valid_session
        assigns(:event_time).should eq(event_time)
      end

      it "redirects to the event_time" do
        event_time = EventTime.create! valid_attributes
        put :update, {:id => event_time.to_param, :event_time => valid_attributes}, valid_session
        response.should redirect_to(event_time)
      end
    end

    describe "with invalid params" do
      it "assigns the event_time as @event_time" do
        event_time = EventTime.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EventTime.any_instance.stub(:save).and_return(false)
        put :update, {:id => event_time.to_param, :event_time => { "event_id" => "invalid value" }}, valid_session
        assigns(:event_time).should eq(event_time)
      end

      it "re-renders the 'edit' template" do
        event_time = EventTime.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        EventTime.any_instance.stub(:save).and_return(false)
        put :update, {:id => event_time.to_param, :event_time => { "event_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested event_time" do
      event_time = EventTime.create! valid_attributes
      expect {
        delete :destroy, {:id => event_time.to_param}, valid_session
      }.to change(EventTime, :count).by(-1)
    end

    it "redirects to the event_times list" do
      event_time = EventTime.create! valid_attributes
      delete :destroy, {:id => event_time.to_param}, valid_session
      response.should redirect_to(event_times_url)
    end
  end

end
