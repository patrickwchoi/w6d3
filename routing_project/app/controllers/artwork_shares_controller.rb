class ArtworkSharesController < ApplicationController
    def index
        artwork_shares = ArtworkShare.all
        render json: artwork_shares
    end

    def create
        artwork_share = ArtworkShare.new(artwork_share_params)
        # render json: artwork_share
        if artwork_share.save
            render json: artwork_share
          else
            render json: artwork_share.errors.full_messages, status: 422
        end
    end

    def show
        artwork_share = ArtworkShare.find(params[:id])
        render json: artwork_share
    end

    def destroy
        artwork_share = ArtworkShare.find(params[:id])
        artwork_share.destroy
        redirect_to artwork_share_url
    end

    private
    def artwork_share_params
        params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
    end
end
