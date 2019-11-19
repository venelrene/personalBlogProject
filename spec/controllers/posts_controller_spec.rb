require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET #index" do
    before do
      get :index
    end

    let(:post) { create :post }

    it "returns a successful response" do
      expect(response).to be_successful
    end

    it "assigns @posts" do
      expect(assigns(:posts)).to eq([post])
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    before do
      get :show, params: { id: post.id }
    end

    let(:post) { create :post }

    it "returns a successful response" do
      expect(response).to be_successful
    end

    it "renders the index template" do
      expect(response).to render_template("show")
    end
  end
end
