require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @posts' do
      post1 = create(:post)
      post2 = create(:post)
      get :index
      expect(assigns(:posts)).to match_array([post2, post1])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    login_user

    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end

    it 'assigns @post' do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      login_user

      it 'creates a new post' do
        expect {
          post :create, params: { post: attributes_for(:post) }
        }.to change(Post, :count).by(1)
      end

      it 'redirects to the index page with a notice' do
        post :create, params: { post: attributes_for(:post) }
        expect(response).to redirect_to(posts_path)
        expect(flash[:notice]).to eq('Post salvo com sucesso')
      end
    end

    context 'with invalid parameters' do
      login_user

      it 'does not create a new post' do
        expect {
          post :create, params: { post: attributes_for(:post, content: nil) }
        }.to_not change(Post, :count)
      end

      it 'renders the new template with unprocessable entity status' do
        post :create, params: { post: attributes_for(:post, content: nil) }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'POST #like' do
    login_user
    let(:post) { create(:post) }
    let(:do_request) { process :like, method: :post, params: { id: post.id } }

    it 'adds a like to the post' do
      expect {
        process :like, method: :post, params: { id: post.id }
      }.to change(post.likes, :count).by(1)
    end

    it 'redirects to the index page' do
      do_request
      expect(response).to redirect_to(posts_path)
    end
  end
end
