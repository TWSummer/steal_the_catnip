class User < ApplicationRecord
    validates_uniqueness_of :session_token

    after_initialize do
        self.session_token ||= (0..40).to_a.map do
            rand(36).to_s(36)
        end.join
    end
end
