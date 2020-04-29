class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :vote]
  before_action :authenticate_user!, except: [:index, :show, :vote, :popular, :guide, :shop]
  respond_to :js, :json, :html

  # skip_before_action :authenticate, only: [:show, :index, :vote]
  # skip_authorization_check only: :vote
  # load_and_authorize_resource except: :vote

  
  # GET /posts
  # GET /posts.json
  def index

    if params.has_key?(:category)
      @category = Category.find_by_name(params[:category])
      @posts = Post.where(category: @category).order("created_at DESC").page(params[:page]).per_page(30)
      # @pagy, @posts = pagy(Post.all, items: 30)
    else
      @posts = Post.all.order("created_at DESC").page(params[:page]).per_page(30)
      # @pagy, @posts = pagy(Post.all, items: 30)
    end


    if params[:search]
      @search_term = params[:search]
      @posts = @posts.search_by(@search_term)
    end

  end

  def guide
    if params.has_key?(:guide)
      @guide = Guide.find_by_name(params[:guide])
      @posts = Post.where(guide: @guide)
    else
      @posts = Post.all
    end
  end

  def shop
    if params.has_key?(:shop)
      @shop = Shop.find_by_name(params[:shop])
      @posts = Post.where(shop: @shop)
    else
      @posts = Post.all
    end
  end

  def popular
    @vote_up = Post.order(:cached_votes_up => :desc)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @favorite_exists = Favorite.where(post: @post, user: current_user) == [] ? false : true

  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def vote
    if !current_user.liked? @post
      @post.liked_by current_user
    elsif current_user.liked? @post
      @post.unliked_by current_user
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description, :category_id, :guide_id, :shop_id, :image, :link, :is_price, :was_price, :pct,
                                   :image_toggle, :video, :source)
    end
end
