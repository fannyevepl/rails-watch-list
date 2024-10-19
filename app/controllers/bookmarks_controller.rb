class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])  # Assure-toi de récupérer la liste à partir de l'ID dans l'URL
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list), notice: 'Le signet a été ajouté avec succès.'
    else
      render :new
    end
  end
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: 'Le signet a été supprimé avec succès.'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
