require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "#index" do
    before do
      get :index
      @post = create :post
    end

    it "returns a successful response" do
      expect(response).to be_successful
    end

    it "assigns @posts" do
      expect(assigns(:posts)).to eq([@post])
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end
  end

  describe "#show" do
    before do
      @post = create :post
      get :show, params: { id: @post.id }
    end

    it "returns a successful response" do
      expect(response).to be_successful
    end

    it "renders the index template" do
      expect(response).to render_template("show")
    end
  end

  describe "#create" do
    before do
      @post = create :post
      get :show, params: { id: @post.id }
    end

    it "should create new post" do
      expect { create(:post) }.to change { Post.count }.by(1)
      expect(response).to be_successful
      expect(response).to render_template("show")
    end

    context "with invalid attributes" do
     let(:post_params) { attributes_for(:post, :invalid) }

      it "denies access to posts#create" do
        expect {
          post :create, params: { post: post_params }
        }.to_not change(Post, :count)
        expect(response).to render_template("new")
      end
    end
  end

  xdescribe "#update", type: :request do

    # let(:post) { create :post }

    context "with good data" do
      before do
        @post = FactoryBot.create(:post)
      end

      it "should update post info" do

        post_params = FactoryBot.attributes_for(:post,
          title: "New Post Name")

          # post_params = {
          #   title: 'Changed title'
          # }

          # put :update, params: { id: post.id, post: post_params }
          # post.reload
          patch :update, params: { id: @post.id, post: post_params }
          # expect {create(:post)}.to change {Post.count}.by(1)
          expect(@post.reload.title).to eq "New Post Name"
        end

        xit "should redirct"do
        expect(response).to be_redirect
      end
    end

    xcontext "with bad data" do
      it "should render edit" do
        params = {
          title: 'Changed title'
        }

        put :update, params: { id: post.id, post: params }
        post.reload

        expect {create(:post)}.to change {Post.count}.by(1)
        expect(response).to be_successful
      end
    end
  end

  xdescribe "#destroy", type: :request do

    let(:post) { create :post }

    it "should destroy post" do
      expect {delete(:post)}.to change {Post.count}.by(1)
      expect(response).to be_successful
    end
  end
end
