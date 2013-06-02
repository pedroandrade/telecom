require 'spec_helper'

describe Admin::PlansController do

  let(:valid_attributes) { plan_valid_attributes }

  let(:plan) { create_plan }

  before { controller.stub(:authetication).and_return(true) }

  it 'assigns all plans as @plans' do
    get :index, {}
    assigns(:plans).should eq([plan])
  end

  describe 'GET' do

    it 'assigns the requested plan as @plan' do
      get :show, {id: plan.id}
      assigns(:plan).should eq(plan)
    end

    it 'assigns a new plan as @plan' do
      get :new, {}
      assigns(:plan).should be_a_new(Plan)
    end

    it 'assigns the requested plan as @plan' do
      get :edit, {id: plan.id}
      assigns(:plan).should eq(plan)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Plan' do
        expect {
          post :create, {plan: valid_attributes}
        }.to change(Plan, :count).by(1)
      end

      it 'assigns a newly created plan as @plan' do
        post :create, {plan: valid_attributes}
        assigns(:plan).should be_a(Plan)
        assigns(:plan).should be_persisted
      end

      it 'redirects to the created plan' do
        post :create, {plan: valid_attributes}
        response.should redirect_to([:admin, Plan.last])
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved plan as @plan' do
        post :create, { plan: {  }}
        assigns(:plan).should be_a_new(Plan)
      end

      it 'validates the required attributes' do
        post :create, { plan: {  }}
        assigns(:plan).should_not be_valid
      end

      it "re-renders the 'new' template" do
        post :create, {plan: {  }}
        response.should render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested plan' do
        Plan.any_instance.should_receive(:update_attributes).with({ 'description' => "params" })
        put :update, {id: plan.id, plan: { 'description' => 'params' }}
      end

      it 'assigns the requested plan as @plan' do
        put :update, {id: plan.id, plan: valid_attributes}
        assigns(:plan).should eq(plan)
      end

      it 'redirects to the plan' do
        put :update, {id: plan.id, plan: valid_attributes}
        response.should redirect_to([:admin, plan])
      end
    end

    describe "with invalid params" do
      it "assigns the plan as @plan" do
        put :update, {id: plan.id, plan: {  }}
        assigns(:plan).should eq(plan)
      end

      it 'validates the required parameters' do
        put :update, {id: plan.id, plan: { name: '' }}
        assigns(:plan).should_not be_valid
      end

      it "re-renders the 'edit' template" do
        put :update, {id: plan.id, plan: { name: '' }}
        response.should render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested plan' do
      plan = Plan.create! valid_attributes
      expect {
        delete :destroy, {id: plan.id}
      }.to change(Plan, :count).by(-1)
    end

    it 'redirects to the plans list' do
      delete :destroy, {id: plan.id}
      response.should redirect_to(admin_plans_url)
    end
  end

end
