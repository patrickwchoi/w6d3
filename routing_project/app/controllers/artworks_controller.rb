class ArtworksController < ApplicationController
  def index
    if params[:user_id] #param key is the wildcard from the request
      artworks = Artwork.joins(:artwork_shares)
        .where("artist_id = #{params[:user_id]} OR viewer_id = #{params[:user_id]}")
        .distinct
      # user = User.find(params[:user_id])
      # artworks = user.artworks #artworks association
    else
      artworks = Artwork.all
    end
    render json: artworks
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    artwork.update!(artwork_params)
    render json: artwork
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    redirect_to artwork_url
  end

  private
  def artwork_params
    params.require(:artworks).permit(:title, :image_url, :artist_id)
  end
end