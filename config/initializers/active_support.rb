class ActiveSupport::TimeWithZone
    def as_json(options = {})
        strftime('%a %b %d at %I:%M %p')
    end
end