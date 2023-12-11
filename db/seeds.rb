# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

thief_cats = [
    { name: 'Shadow Whisper', ability: 'This cat can move silently, becoming nearly invisible in low light, perfect for stealthy infiltrations.'},
    { name: 'Gadget Paws', ability: 'An expert in technology, Gadget Paws can disable alarms and unlock electronic doors with ease.'},
    { name: 'Whisker Twist', ability: 'With incredible agility, Whisker Twist can squeeze through the tiniest gaps and evade capture.'},
    { name: 'Mystic Mew', ability: 'Possessing psychic abilities, Mystic Mew can foresee short-term future events, aiding in planning the perfect heist.'},
    { name: 'Purrloin', ability: 'A master of disguise, Purrloin can mimic the appearance of other cats, confusing guards and bypassing security.'},
    { name: 'Feline Flicker', ability: 'This cat can teleport short distances, bypassing obstacles and barriers effortlessly.'},
    { name: 'Nimble Claw', ability: 'Known for exceptional climbing skills, Nimble Claw can scale walls and access high points easily.'},
    { name: 'Blink Bandit', ability: 'With the power to briefly turn invisible, Blink Bandit can sneak past guards unseen.'},
    { name: 'Echo Ears', ability: 'This cat can hear even the faintest sounds, detecting approaching threats or eavesdropping on conversations.'},
    { name: 'Tangle Tail', ability: 'Specializing in traps, Tangle Tail can set up snares and traps to distract or capture guards.'},
    { name: 'Sneak Slink', ability: 'With extraordinary balance and grace, Sneak Slink can navigate perilous paths without making a sound.'},
    { name: 'Hacker Hiss', ability: 'An expert in cybersecurity, Hacker Hiss can hack into security systems and manipulate data.'},
    { name: 'Mystique Meow', ability: 'Capable of hypnotizing others with its gaze, Mystique Meow can control minds temporarily.'},
    { name: 'Quick Quiver', ability: 'Known for exceptional speed, Quick Quiver can outrun any pursuer and snatch objects in a blink.'},
    { name: 'Frost Fur', ability: 'This cat can lower temperatures, freezing locks or creating slippery surfaces to hinder pursuers.'},
    { name: 'Charm Chaser', ability: 'Using irresistible charm, Charm Chaser can persuade others to help in the heist or turn a blind eye.'},
    { name: 'Shadow Swipe', ability: 'A master pickpocket, Shadow Swipe can steal keys, cards, or other small items without detection.'},
    { name: 'Vortex Velvet', ability: 'This cat can create small whirlwinds, disorienting guards and clearing pathways.'},
    { name: 'Spectral Sway', ability: 'With the ability to walk through walls, Spectral Sway can bypass physical barriers effortlessly.'},
    { name: 'Ink Illusion', ability: 'Specializing in creating illusions, Ink Illusion can project fake images to distract and deceive guards.'},
]

thief_cats.each do |cat_info|
    cat = Cat.find_or_initialize_by(name: cat_info[:name])
    cat.update(side: 'thief', ability: cat_info[:ability])
end

defender_cats = [
    { name: 'Sergeant Sniffer', ability: 'This cat has an exceptional sense of smell, able to detect even the faintest trace of intruders.' },
    { name: 'Inspector Whiskers', ability: 'Equipped with a hypersensitive hearing ability, Inspector Whiskers can detect the slightest sound of a trespasser.' },
    { name: 'Guardian Gaze', ability: 'With keen eyesight, Guardian Gaze can spot suspicious activities from great distances.' },
    { name: 'Detective Dash', ability: 'Known for incredible speed and reflexes, Detective Dash can quickly respond to any security breach.' },
    { name: 'Lieutenant Hobbes', ability: 'This cat can analyze and interpret patterns, predicting criminals\' next moves with high accuracy.' },
    { name: 'Captain Clever', ability: 'An expert in strategy, Captain Clever can outmaneuver and outthink criminal minds.' },
    { name: 'Sentry Sparkle', ability: 'Possessing a photographic memory, Sentry Sparkle can remember every detail and spot discrepancies instantly.' },
    { name: 'Ranger Ripple', ability: 'Specialized in tracking, Ranger Ripple can follow trails left by intruders effortlessly.' },
    { name: 'Scout Shadow', ability: 'With the ability to blend into surroundings, Scout Shadow can surveil without being detected.' },
    { name: 'Vigilant Velvet', ability: 'This cat has a sixth sense for danger, sensing threats before they materialize.' },
    { name: 'Marshal Muzzle', ability: 'An expert in communications, Marshal Muzzle can coordinate complex security operations and team responses.' },
    { name: 'Paladin Pounce', ability: 'Skilled in physical confrontations, Paladin Pounce can apprehend any intruder with agility and strength.' },
    { name: 'Oracle Ogle', ability: 'Possessing precognitive glimpses, Oracle Ogle can foresee criminal acts before they happen.' },
    { name: 'Tracker Tumble', ability: 'Specializing in urban environments, Tracker Tumble can navigate complex landscapes to follow suspects.' },
    { name: 'Enforcer Echo', ability: 'With the ability to mimic any sound, Enforcer Echo can create diversions or call for reinforcements.' },
    { name: 'Sentinel Swoop', ability: 'Known for aerial surveillance skills, Sentinel Swoop can observe large areas from above.' },
    { name: 'Warden Whirl', ability: 'This cat can create barriers and control access points, securing critical areas against intrusion.' },
    { name: 'Knight Knack', ability: 'Equipped with exceptional problem-solving skills, Knight Knack can quickly devise countermeasures against criminal tactics.' },
    { name: 'Mystic Mirror', ability: 'Capable of reflecting or revealing invisible or disguised intruders, Mystic Mirror is invaluable in uncovering hidden threats.' },
    { name: 'Gale Guard', ability: 'With the ability to control wind currents, Gale Guard can manipulate the environment to hinder or expose criminals.' },
]

defender_cats.each do |cat_info|
    cat = Cat.find_or_initialize_by(name: cat_info[:name])
    cat.update(side: 'defend', ability: cat_info[:ability])
end

locations = [
    { name: 'The Grand Greenhouse', description: 'Lush and full of exotic plants, the catnip is hidden in a secret compartment beneath a rare orchid.' },
    { name: 'Mystic Museum', description: 'An ancient museum with relics and artifacts. The catnip is tucked inside an Egyptian sarcophagus.' },
    { name: 'Moonlit Mansion', description: 'A sprawling estate with many rooms. The catnip is locked in a safe behind a painting in the study.' },
    { name: 'High-Tech Tower', description: 'A modern skyscraper with advanced security. The catnip is in a biometrically-secured vault on the top floor.' },
    { name: 'Seaside Shack', description: 'A quaint cabin by the beach. The catnip is buried under the floorboards, near a fireplace.' },
    { name: 'Enchanted Library', description: 'A vast library with magical books. The catnip is hidden in a hollow book on a secret shelf.' },
    { name: 'Royal Castle', description: 'A medieval castle with towers and dungeons. The catnip is inside the royal treasury, guarded by knights.' },
    { name: 'Secret Subway', description: 'An abandoned underground station. The catnip is in an old train carriage, under a rusty seat.' },
    { name: 'Pirate Shipwreck', description: 'Sunken and forgotten at sea. The catnip is in a waterproof chest in the captain\'s cabin.' },
    { name: 'Spooky Cemetery', description: 'An eerie graveyard with fog and crypts. The catnip is inside a mausoleum, beneath a marble statue.' },
    { name: 'Circus Tent', description: 'Colorful and bustling with activity. The catnip is stashed in a locked trunk under the acrobats\' net.' },
    { name: 'Mountain Cabin', description: 'Nestled in snowy peaks. The catnip is hidden in a wall cavity, accessible only from outside.' },
    { name: 'Underwater Aquarium', description: 'A large aquarium with exotic fish. The catnip is in a sealed container in the shipwreck exhibit.' },
    { name: 'Zen Garden', description: 'Peaceful and serene with koi ponds. The catnip is buried in a small, unmarked grave under a cherry blossom tree.' },
    { name: 'Old Opera House', description: 'Grand and slightly run-down. The catnip is in a prop box on the stage, behind heavy velvet curtains.' },
    { name: 'Space Station', description: 'Orbiting Earth in space. The catnip is stored in a climate-controlled compartment in the research lab.' },
    { name: 'Wild West Town', description: 'A dusty, abandoned town. The catnip is in a locked safe in the old bank, hidden behind a false wall.' },
    { name: 'Rainforest Camp', description: 'Deep in the jungle. The catnip is in a camouflaged container suspended in a tall tree.' },
    { name: 'Art Studio', description: 'Cluttered with paintings and sculptures. The catnip is inside a hollow sculpture in the center of the room.' },
    { name: 'Vintage Train', description: 'A classic locomotive chugging through scenic landscapes. The catnip is in a briefcase under a seat in the luxury carriage.' },
]

locations.each do |location_info|
    location = Location.find_or_initialize_by(name: location_info[:name])
    location.update(description: location_info[:description])
end
