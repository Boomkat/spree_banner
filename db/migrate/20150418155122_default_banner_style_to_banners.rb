class DefaultBannerStyleToBanners < ActiveRecord::Migration
  def change
    Spree::BannerBox.all.each do |banner|
      banner.banner_style = 'banner-style-white'
      banner.save
    end

    Spree::BannerBoxHero.all.each do |banner|
      banner.banner_style = 'banner-style-white'
      banner.save
    end
  end
end
