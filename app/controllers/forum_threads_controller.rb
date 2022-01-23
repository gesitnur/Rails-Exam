class ForumThreadsController < ApplicationController
    def index
        @threads = ForumThread.order(id: :desc)
    end

    
    def show
        @thread = ForumThread::find(params[:id])
    end

    def new
        @thread = ForumThread.new
    end

    def create
        @thread = ForumThread.new(resource_param)
        @thread.user = User.first
        if @thread.save
            puts 'berhasil disimpan'
            redirect_to root_path
        else
            puts @thread.error.full_messages
        end
    end

    private 

    def resource_param
        params.require(:forum_thread). permit(:title, :content)
    end

end