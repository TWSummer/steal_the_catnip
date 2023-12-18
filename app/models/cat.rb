class Cat < ApplicationRecord
    def image_name
        "#{name.gsub(' ', '_').underscore}.jpg"
    end
end
