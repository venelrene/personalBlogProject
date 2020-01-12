require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe '#index' do
    before do
      get :index
      @post = create :post
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'assigns @posts' do
      expect(assigns(:posts)).to eq([@post])
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe '#show' do
    before do
      @post = create :post
      get :show, params: { id: @post.id }
    end

    it 'locates the requested @post' do
      expect(assigns(:post)).to eq(@post)
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'renders the index template' do
      expect(response).to render_template('show')
    end
  end

  describe '#create' do

    context 'with valid attributes' do
      before do
        @post = create :post
        get :show, params: { id: @post.id }
      end

      it 'creates a new post' do
        expect { create(:post) }.to change { Post.count }.by(1)
        expect(response).to be_successful
      end

      it 'redirects to the new post' do
        expect(response).to render_template('show')
      end
    end

    context 'with invalid attributes' do
      let(:post_params) { attributes_for(:post, :invalid) }

      it 'does not save the new post' do
        expect {
          post :create, params: { post: post_params }
        }.to_not change(Post, :count)
        expect(response).to render_template('new')
      end

      it 're-renders the new method' do
        post :create, params: { post: post_params }
        expect(response).to render_template('new')
      end
    end
  end

  describe '#update' do
    context 'with valid attributes' do
      before do
        @post = create :post
        post_params = attributes_for(:post, title: 'New Post Name')
        patch :update, params: { id: @post.id, post: post_params }
      end

      it 'locates the requested @post' do
        expect(assigns(:post)).to eq(@post)
      end

      it 'should update post attribute' do
        expect(@post.reload.title).to eq 'New Post Name'
      end

      it 'redirects to the updated post' do
        expect(response).to redirect_to @post
      end
    end

    context 'with invalid attributes' do
      before do
        @post = create :post
        post_params = attributes_for(:post, title: 'New Post Name')
        patch :update, params: { id: @post.id, post: post_params }
      end

      it 'locates the requested @post' do
        expect(assigns(:post)).to eq(@post)
      end

      it 'does not change @post attribute' do
        patch :update, params: {
          id: @post.id,
          post: attributes_for(:post, :invalid)
        }
        expect(@post.reload.title).to eq 'New Post Name'
      end

      it 're-renders the edit method' do
        patch :update, params: {
          id: @post.id,
          post: attributes_for(:post, :invalid)
        }
        expect(response).to render_template('edit')
      end
    end
  end

  describe '#destroy' do
    let(:post) { create :post }

    it 'deletes a post' do
      expect {
        delete :destroy, params: { id: post.id }
      }.to change { Post.count }.by(-1)
    end

    it 'redirects to the index' do
      delete :destroy, params: { id: post.id }
      expect(response).to redirect_to posts_path
    end
  end
end
