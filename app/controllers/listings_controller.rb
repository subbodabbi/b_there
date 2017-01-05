class ListingsController < ApplicationController
	before_action :find_listing, only: [:show, :edit, :update]
	
	def index
	  if params[:tag]
	  	@listings = Listing.tagged_with(params[:tag]).page params[:page]
      elsif params[:search]
        @listings = Listing.search(params[:search]).order(id: :desc).page params[:page]
      else
        @listings = Listing.all.order(id: :desc).page params[:page]	
	  end
	end

	def new
	  @listing = Listing.new
	end

	def create
		@listing = current_user.listings.new(listing_params)
		if @listing.save
			redirect_to listings_path
		end
	end

	def show
	  @booking = @listing.bookings.new
	end

	def edit
	end

	def update
		if @listing.update(listing_params)
			flash[:success] = "Successfully updated"
			redirect_to @listing
		else
			flash[:danger] = "Sorry, something went wrong. Try again later."
			render :edit
		end
	end

	def find_listing
		@listing = Listing.find(params[:id])
	end

	def destroy
	end

  private

	def listing_params
	  params.require(:listing).permit(:title, :description, :address, :max_guests, :price, :tag_list, :verification, {images: []})
    end

    def filtering_params(params)
      params.slice(:title, :min_price, :max_price, :address, :guest_num)
    end

end
