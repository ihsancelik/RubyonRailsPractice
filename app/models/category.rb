class Category < ApplicationRecord

    after_save :after_saved
    before_save :before_saved
    before_destroy :before_destroyed
    before_update :before_updated
    after_create :send_notification


    private
    
    def after_saved
        print "\n@@@@@ after saved run! @@@@\n"
    end

    def before_saved
        print "\n@@@@@ before saved run! @@@@\n"
    end

    def before_destroyed
        print "\n@@@@@ before destroyed run! @@@@\n"
    end

    def before_updated
        print "\n@@@@@ before updated run! @@@@\n"
    end

    def send_notification
        print "Notification sent!"
    end

end
