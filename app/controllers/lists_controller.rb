class ListsController < ApplicationController  

  def index
    @lists = List.all    
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list: @list)
    @review = Review.new(list: @list)
    
  end

  def new
    @list = List.new()
  end

  def create
    @list = List.new(list_params)
    if @list.save 
        redirect_to list_path(@list), notice: 'list was successfully created.'
    else 
       render :new 
    end  
  end

  private

  def list_params
    params.required(:list).permit(:name, :photo)
  end  
end

