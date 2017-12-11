class PostsController < ApplicationController
    before_filter :authenticate_user!, except: [:show, :index]
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
    	@post = Post.new
    end

    def create

    	@user = current_user
        @post = Post.new(allowed_params)
        @post.user = current_user

        if @post.save
            flash[:success] = "Created new post"
            redirect_to @post
        else
            render 'new'
        end
    end

    private
        def allowed_params
            params.require(:post).permit(:title, :body)
        end
end