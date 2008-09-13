#

class WelcomeController < ApplicationController
  def index
    @upcoming_categories = UpcomingCategory.find(:all)
    @music = UpcomingCategory.find(:all, :conditions => ["name = ?", "Media"])
  end
  def search
    if (params[:search_text].blank? or params[:location].blank?) then
      flash[:error] = "You have chosen poorly, try again..."
      return redirect_to({:action => :index})
    end

    @pager = WillPaginate::Collection.create(params[:page] || 1, 5, 100) { |pager|
      @upcoming_events = UpcomingEvent.find(:all, :conditions => [
        "search_text = ? and location = ? and start_date < ?",
        params[:search_text], params[:location], 1.day.from_now.strftime("%Y-%m-%d")
      ], :offset => pager.offset, :limit => pager.per_page)
    }
  end
end
