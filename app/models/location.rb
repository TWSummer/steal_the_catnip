class Location < ApplicationRecord
    def image_name
        "#{name.gsub!(' ', '_').underscore}.jpg"
    end
end
