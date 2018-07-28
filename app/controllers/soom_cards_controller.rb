class SoomCardsController < ApplicationController
    def index
        require 'icalendar'

        # Create a calendar with an event (standard method)
        cal = Icalendar::Calendar.new
        cal.event do |e|
        e.dtstart     = Icalendar::Values::Date.new('20050428')
        e.dtend       = Icalendar::Values::Date.new('20050429')
        e.summary     = "Meeting with the man."
        e.description = "Have a long lunch meeting and decide nothing..."
        e.ip_class    = "PRIVATE"
        end

        cal.publish
        #render 'index'
    end

    def new
        
    end

    def create
        
    end

    def destroy
        
    end


    def day_list
        
    end

    def deul_soom
        
    end

    def nal_soom
        
    end

    def notice
    
    end

end
