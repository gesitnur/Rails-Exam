class ForumThreadsController < ApplicationController
    def index
        @threads = ForumThread.order(id: :desc)
    end

    
    def show
        @thread = ForumThread::find(params[:id])
        @post = ForumPost.new
    end

    def new
        @thread = ForumThread.new
    end

    def create
        @thread = ForumThread.new(resource_param)
        @thread.user = current_user

        if @thread.save
            puts 'berhasil disimpan'
            redirect_to root_path
        else
            render 'new'
        end
    end

    private 

    def resource_param
        params.require(:forum_thread). permit(:title, :content)
    end

end