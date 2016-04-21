# Create the admin user

User.create!(
  name:  "Michael Broadwater",
  email: "mike.broadwater@gmail.com",
  password: "test1234",
  password_confirmation: "test1234",
  admin: true
)

# Seed the base attribute table
BaseAttribute.create!(
  name: "Body",
  category: "Physical"
)

BaseAttribute.create!(
  name: "Agility",
  category: "Physical"
)

BaseAttribute.create!(
  name: "Reaction",
  category: "Physical"
)

BaseAttribute.create!(
  name: "Strength",
  category: "Physical"
)

BaseAttribute.create!(
  name: "Willpower",
  category: "Mental"
)

BaseAttribute.create!(
  name: "Logic",
  category: "Mental"
)

BaseAttribute.create!(
  name: "Intuition",
  category: "Mental"
)

BaseAttribute.create!(
  name: "Charisma",
  category: "Mental"
)

BaseAttribute.create!(
  name: "Essence",
  category: "Special"
)

BaseAttribute.create!(
  name: "Edge",
  category: "Special"
)

BaseAttribute.create!(
  name: "Reaction",
  category: "Special"
)

BaseAttribute.create!(
  name: "Magic",
  category: "Special"
)

BaseAttribute.create!(
  name: "Resonance",
  category: "Special"
)

# Seed the base skill table

BaseSkill.create!(
  name: "Archery",
  group: ""
)

BaseSkill.create!(
  name: "Automatics",
  group: "Firearms"
)
BaseSkill.create!(
  name: "Blades",
  group: "Close Combat"
)

BaseSkill.create!(
  name: "Clubs",
  group: "Close Combat"
)

BaseSkill.create!(
  name: "Exotic Melee Weapon",
  group: ""
)

BaseSkill.create!(
  name: "Exotic Ranged Weapon",
  group: ""
)

BaseSkill.create!(
  name: "Heavy Weapons",
  group: ""
)

BaseSkill.create!(
  name: "Longarms",
  group: "Firearms"
)

BaseSkill.create!(
  name: "Pistols",
  group: "Firearms"
)

BaseSkill.create!(
  name: "Throwing Weapons",
  group: ""
)

BaseSkill.create!(
  name: "Unarmed Combat",
  group: "Close Combat"
)

BaseSkill.create!(
  name: "Disguise",
  group: "Stealth"
)

BaseSkill.create!(
  name: "Diving",
  group: ""
)

BaseSkill.create!(
  name: "Escape Artist",
  group: ""
)

BaseSkill.create!(
  name: "Flight",
  group: ""
)

BaseSkill.create!(
  name: "Free Fall",
  group: ""
)

BaseSkill.create!(
  name: "Gymnastics",
  group: "Athletics"
)

BaseSkill.create!(
  name: "Palming",
  group: "Stealth"
)

BaseSkill.create!(
  name: "Perception",
  group: ""
)

BaseSkill.create!(
  name: "Running",
  group: "Athletics"
)

BaseSkill.create!(
  name: "Sneaking",
  group: "Stealth"
)

BaseSkill.create!(
  name: "Survival",
  group: "Outdoors"
)

BaseSkill.create!(
  name: "Swimming",
  group: "Athletics"
)

BaseSkill.create!(
  name: "Tracking",
  group: "Outdoors"
)

BaseSkill.create!(
  name: "Con",
  group: "Acting"
)

BaseSkill.create!(
  name: "Etiquette",
  group: "Influence"
)

BaseSkill.create!(
  name: "Impersonation",
  group: "Acting"
)

BaseSkill.create!(
  name: "Instruction",
  group: ""
)

BaseSkill.create!(
  name: "Intimidation",
  group: ""
)

BaseSkill.create!(
  name: "Leadership",
  group: "Influence"
)

BaseSkill.create!(
  name: "Negotiation",
  group: "Influence"
)

BaseSkill.create!(
  name: "Performance",
  group: "Acting"
)

BaseSkill.create!(
  name: "Alchemy",
  group: "Enchanting"
)

BaseSkill.create!(
  name: "Arcana",
  group: ""
)

BaseSkill.create!(
  name: "Artificing",
  group: "Enchanting"
)

BaseSkill.create!(
  name: "Assensing",
  group: ""
)

BaseSkill.create!(
  name: "Astral Combat",
  group: ""
)

BaseSkill.create!(
  name: "Banishing",
  group: "Conjuring"
)

BaseSkill.create!(
  name: "Binding",
  group: "Conjuring"
)

BaseSkill.create!(
  name: "Counterspelling",
  group: "Sorcery"
)

BaseSkill.create!(
  name: "Disenchanting",
  group: "Enchanting"
)

BaseSkill.create!(
  name: "Ritual Spellcasting",
  group: "Sorcery"
)

BaseSkill.create!(
  name: "Spellcasting",
  group: "Sorcery"
)

BaseSkill.create!(
  name: "Summoning",
  group: "Conjuring"
)

BaseSkill.create!(
  name: "Compiling",
  group: "Tasking"
)

BaseSkill.create!(
  name: "Decompiling",
  group: "Tasking"
)

BaseSkill.create!(
  name: "Registering",
  group: "Tasking"
)

BaseSkill.create!(
  name: "Aeronautics Mechanic",
  group: "Engineering"
)

BaseSkill.create!(
  name: "Animal Handling",
  group: ""
)

BaseSkill.create!(
  name: "Armorer",
  group: ""
)

BaseSkill.create!(
  name: "Artisan",
  group: ""
)

BaseSkill.create!(
  name: "Automotive Mechanic",
  group: "Engineering"
)

BaseSkill.create!(
  name: "Biotechnology",
  group: "Biotech"
)

BaseSkill.create!(
  name: "Chemistry",
  group: ""
)

BaseSkill.create!(
  name: "Computer",
  group: "Electronics"
)

BaseSkill.create!(
  name: "Cybercombat",
  group: "Cracking"
)

BaseSkill.create!(
  name: "Cybertechnology",
  group: "Biotech"
)

BaseSkill.create!(
  name: "Demolitions",
  group: ""
)

BaseSkill.create!(
  name: "Electronic Warfare",
  group: "Cracking"
)

BaseSkill.create!(
  name: "First Aid",
  group: "Biotech"
)

BaseSkill.create!(
  name: "Forgery",
  group: ""
)

BaseSkill.create!(
  name: "Hacking",
  group: "Cracking"
)

BaseSkill.create!(
  name: "Hardware",
  group: "Electronics"
)

BaseSkill.create!(
  name: "Industrial Mechanic",
  group: "Engineering"
)

BaseSkill.create!(
  name: "Locksmith",
  group: ""
)

BaseSkill.create!(
  name: "Medicine",
  group: ""
)

BaseSkill.create!(
  name: "Nautical Mechanic",
  group: "Engineering"
)

BaseSkill.create!(
  name: "Navigation",
  group: "Outdoors"
)

BaseSkill.create!(
  name: "Software",
  group: "Electronics"
)

BaseSkill.create!(
  name: "Gunnery",
  group: ""
)

BaseSkill.create!(
  name: "Pilot Aerospace",
  group: ""
)

BaseSkill.create!(
  name: "Pilot Aircraft",
  group: ""
)

BaseSkill.create!(
  name: "Pilot Exotic Vehicle",
  group: ""
)

BaseSkill.create!(
  name: "Pilot Ground Craft",
  group: ""
)

BaseSkill.create!(
  name: "Pilot Walker",
  group: ""
)

BaseSkill.create!(
  name: "Pilot Watercraft",
  group: ""
)
