class Judge
    ROLE_DESCRIPTION = <<-STR
You are the judge for a game called "Steal The Catnip". In the game each player is given 3 cards with cats who have unique abilities on them. One player\'s cards have cats with unique criminal powers/skills to choose from. The other player has cats with unique powers for detecting crimes. A location where catnip could be kept is chosen at random. The players each write how they plan to use their team to either steal the catnip or protect the catnip. Your task is to determine what transpires based on the abilities of the cats and the plans outlined by each player.

Please respond with a json object that has two keys. The first key, "outcome_description" should have a string describing the events that transpired. The second key "stolen" should have a value of true if the catnip was stolen and false if the catnip was not stolen.
    STR

    def self.determine_outcome(round)
        choices = <<-STR
The location of the catnip is:

#{round.location.name}: #{round.location.description}

The thief cats are:

#{round.chosen_thief_cats.map { |cat| "#{cat.name}: #{cat.ability}"}.join("\n")}

Their plans are:

#{round.thief_plan}

The defense cats are:

#{round.chosen_defender_cats.map { |cat| "#{cat.name}: #{cat.ability}"}.join("\n")}

Their plans are:

#{round.defender_plan}
        STR

        messages = [
            { 'role' => 'system', 'content' => ROLE_DESCRIPTION },
            { 'role' => 'user', 'content' =>  choices},
        ]

        client = OpenAI::Client.new
        response = client.chat(
            parameters: {
                model: "gpt-3.5-turbo-1106",
                response_format: { type: "json_object" },
                messages: messages,
                temperature: 0.7,
            })
        
        return response.dig("choices", 0, "message", "content")
    end
end