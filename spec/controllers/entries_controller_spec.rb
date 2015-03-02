require 'rails_helper'
require 'simplecov'
SimpleCov.start

describe EntriesController, type: :controller do
  context '#index' do
    it 'is successful' do
      get :index
      expect(response).to be_successful
    end

    it "assigns Entry.all to @entries" do
      get :index
      expect(assigns(:entries)).to eq Entry.all
    end
  end

  context '#show' do
    before :each do
      @entry = Entry.create
    end

    xit "assigns @entry to entry" do
      get :show, id: @entry
      expect(assigns(:entry)).to eq @entry
    end

    xit "is successful" do
      get :show, id: @entry
      expect(response).to be_successful
    end

    xit "renders template" do
      get :show, id: @entry
      expect(response).to render_template :show
    end
  end

  # describe "Post#create" do
  #   context 'valid attributes' do
  #     it "creates new entry" do
  #       expect{
  #         post :create,
  #         entry: attributes_for(:entry)
  #       }.to change(Entry, :count).by(1)
  #     end
  #   end
  # end

  describe 'Put#update' do
    before :each do
      @entry = create(:entry, title: "sadgaweg", content: "asdfasdga")
    end

    context 'with valid attributes' do
      it 'updates the attributes' do
        put :update, id: @entry, entry: attributes_for(:entry, title: "hello")
        @entry.reload
        expect(@entry.title).to eq("hello")
      end
    end

  end

end

