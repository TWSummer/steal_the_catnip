require "down"
require "fileutils"

class LocationPhotoGenerator
    def self.generate_image_for(location)
        client = OpenAI::Client.new
        
        prompt = "A location called #{location.name} where catnip has been hidden. The location is #{location.description}"
        response = client.images.generate(parameters: { prompt: prompt, model: 'dall-e-3', size: '1024x1024' })

        tempfile = Down.download(response.dig("data", 0, "url"))
        FileUtils.mv(tempfile.path, "#{ Rails.root.join('app', 'assets', 'images', 'locations', location.image_name) }")
    end
end