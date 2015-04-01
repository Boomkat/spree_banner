module Spree
  module Admin
    class BannerBoxLocationsController < ResourceController
      def index
        @locations = Spree::BannerBoxLocation.all
        respond_with(@locations)

      end

      def show

      end


      def update

        respond_to do |format|
          format.html {
            flash[:notice] = t(:banner_settings_updated)
            redirect_to edit_admin_banner_box_settings_path
          }
        end
      end

      protected
      def find_resource
        Spree::BannerBoxLocation.find(params[:id])
      end
      def collection
        return @collection if @collection.present?
        params[:q] ||= {}
        params[:q][:s] ||= "category, position asc"

        @search = super.ransack(params[:q])
        @collection = @search.result.page(params[:page]).per(Spree::Config[:admin_products_per_page])
      end

    end


  end
end