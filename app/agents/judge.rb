class Judge
    ROLE_DESCRIPTION = <<-STR
You are the judge for a game called "Steal The Catnip". In the game each player is given 3 cards with cats who have unique abilities on them. One player\'s cards have cats with unique criminal powers/skills to choose from. The other player has cats with unique powers for detecting crimes. A location where catnip could be kept is chosen at random. The players each write how they plan to use their team to either steal the catnip or protect the catnip. Your task is to determine what transpires based on the abilities of the cats and the plans outlined by each player.

Please respond with a json object that has two keys. The first key, "outcome_description" should have a string describing the events that transpired. The second key "stolen" should have a value of true if the catnip was stolen and false if the catnip was not stolen.
    STR

    def self.determine_outcome
        choices = <<-STR
The location of the catnip is:

The Secret Garden: A hidden, overgrown garden with ancient statues and a maze of hedges. The catnip is located in the center of the maze.

The thief cats are:

1. Shadow Whisper: This cat can move silently, becoming nearly invisible in low light, perfect for stealthy infiltrations.
2. Nimble Claw: Known for exceptional climbing skills, Nimble Claw can scale walls and access high points easily.
3. Mystique Meow: Capable of hypnotizing others with its gaze, Mystique Meow can control minds temporarily.

Their plans are:

Shadow Whisper stalks out the location to determine the location of the guards. Shadow reports to Mistique Meow who then goes in and hypnotizes the guards. Nimble Claw then scales the walls of the maze to grab the catnip and climbs back out.

The defense cats are:

1. Guardian Gaze: With keen eyesight, Guardian Gaze can spot suspicious activities from great distances.
2. Ranger Ripple: Specialized in tracking, Ranger Ripple can follow trails left by intruders effortlessly.
3. Paladin Pounce: Skilled in physical confrontations, Paladin Pounce can apprehend any intruder with agility and strength.

Their plans are:

Guardian Gaze keeps constant watch on the target. Ranger Ripple patrols the maze searching for any signs of a disturbance. Paladin Pounce sits waiting in hiding in the wall nearest the catnip to pounce on anyone that tries to take the catnip.
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
        
        puts response.dig("choices", 0, "message", "content")
    end
end