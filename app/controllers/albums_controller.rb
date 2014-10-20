class AlbumsController <ApplicationController
  before_filter :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to @album, notice: 'Album was successfully created.'
    else
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def edit
  end

  def update
    if @album.update(album_params)
      redirect_to @album, notice: 'Album was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
   @album = Album.find(params[:id])
    @album.destroy
      redirect_to @album, notice: 'Album was successfully deleted.'
    # else
    #   render :index
    # end
  end

  private
  def set_album
    @album = Album.find(params[:id])
  end
  def album_params
    params.require(:album).permit(:title, :artist, :year)
  end
end
