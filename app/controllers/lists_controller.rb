class ListsController < ApplicationController  

  def index
    @lists = List.all    
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(params[:list_id])
  end

  def new
    @list = List.new()
  end

  def create
    @list = List.new(list_params)
        if @list.save 
            redirect_to lists_path(@list), notice: 'list was successfully created.'
        else 
            render :new 
        end  
  end

  private

  def list_params
    params.required(:list).permit(:name)
  end  
end

