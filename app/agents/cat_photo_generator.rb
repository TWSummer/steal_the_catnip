require "down"
require "fileutils"

class CatPhotoGenerator
    def self.generate_image_for(cat)
        client = OpenAI::Client.new
        
        prompt = "Photorealistic image of a cat named #{cat.name} with the superpower #{cat.ability}"
        response = client.images.generate(parameters: { prompt: prompt, model: 'dall-e-3', size: '1024x1024' })

        tempfile = Down.download(response.dig("data", 0, "url"))
        FileUtils.mv(tempfile.path, "#{ Rails.root.join('app', 'assets', 'images', 'cats', cat.image_name) }")
    end
end