module Admin
  # None Crud pages for admin namespace
  class PagesController < ApplicationController
    layout 'admin'
    def dashboard
      @users = User.all
      @events = Event.all
    end

    def donations
      @donations = Donation.all
    end

    def emails; end

    def payments; end

    def reports; end
  end
end
