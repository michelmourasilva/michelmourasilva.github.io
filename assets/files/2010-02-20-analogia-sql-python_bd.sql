CREATE TABLE SUPER_HEROES_INFORMATION
(
  ID NUMBER(14) -- Identificador autonumérico
, NAME VARCHAR2(25 BYTE) -- O nome ou alias do super héroi
, GENDER VARCHAR2(6 BYTE) -- Gênero do super héroi
, EYE_COLOR VARCHAR2(23 BYTE) -- Cor do olho
, RACE VARCHAR2(18 BYTE)  -- Raça
, HAIR_COLOR VARCHAR2(16 BYTE)  -- Cor do cabelo
, HEIGHT VARCHAR2(5 BYTE)  -- Medida em cêntimetros 
, PUBLISHER VARCHAR2(17 BYTE) -- Editora de publicação
, SKIN_COLOR VARCHAR2(14 BYTE) -- Cor da pele
, ALIGNMENT VARCHAR2(7 BYTE)  -- Indica o comportamento do Heroi/Vilão
, WEIGHT VARCHAR2(5 BYTE) -- The weight measured in pound
);

CREATE TABLE SUPER_HEROES_POWERS 
(
  HERO_NAMES VARCHAR2(25 BYTE) 
, AGILITY VARCHAR2(5 BYTE) 
, ACCELERATED_HEALING VARCHAR2(5 BYTE) 
, LANTERN_POWER_RING VARCHAR2(5 BYTE) 
, DIMENSIONAL_AWARENESS VARCHAR2(5 BYTE) 
, COLD_RESISTANCE VARCHAR2(5 BYTE) 
, DURABILITY VARCHAR2(5 BYTE) 
, STEALTH VARCHAR2(5 BYTE) 
, ENERGY_ABSORPTION VARCHAR2(5 BYTE) 
, FLIGHT VARCHAR2(5 BYTE) 
, DANGER_SENSE VARCHAR2(5 BYTE) 
, UNDERWATER_BREATHING VARCHAR2(5 BYTE) 
, MARKSMANSHIP VARCHAR2(5 BYTE) 
, WEAPONS_MASTER VARCHAR2(5 BYTE) 
, POWER_AUGMENTATION VARCHAR2(5 BYTE) 
, ANIMAL_ATTRIBUTES VARCHAR2(5 BYTE) 
, LONGEVITY VARCHAR2(5 BYTE) 
, INTELLIGENCE VARCHAR2(5 BYTE) 
, SUPER_STRENGTH VARCHAR2(5 BYTE) 
, CRYOKINESIS VARCHAR2(5 BYTE) 
, TELEPATHY VARCHAR2(5 BYTE) 
, ENERGY_ARMOR VARCHAR2(5 BYTE) 
, ENERGY_BLASTS VARCHAR2(5 BYTE) 
, DUPLICATION VARCHAR2(5 BYTE) 
, SIZE_CHANGING VARCHAR2(5 BYTE) 
, DENSITY_CONTROL VARCHAR2(5 BYTE) 
, STAMINA VARCHAR2(5 BYTE) 
, ASTRAL_TRAVEL VARCHAR2(5 BYTE) 
, AUDIO_CONTROL VARCHAR2(5 BYTE) 
, DEXTERITY VARCHAR2(5 BYTE) 
, OMNITRIX VARCHAR2(5 BYTE) 
, SUPER_SPEED VARCHAR2(5 BYTE) 
, POSSESSION VARCHAR2(5 BYTE) 
, ANIMAL_ORIENTED_POWERS VARCHAR2(5 BYTE) 
, WEAPON_BASED_POWERS VARCHAR2(5 BYTE) 
, ELECTROKINESIS VARCHAR2(5 BYTE) 
, DARKFORCE_MANIPULATION VARCHAR2(5 BYTE) 
, DEATH_TOUCH VARCHAR2(5 BYTE) 
, TELEPORTATION VARCHAR2(5 BYTE) 
, ENHANCED_SENSES VARCHAR2(5 BYTE) 
, TELEKINESIS VARCHAR2(5 BYTE) 
, ENERGY_BEAMS VARCHAR2(5 BYTE) 
, MAGIC VARCHAR2(5 BYTE) 
, HYPERKINESIS VARCHAR2(5 BYTE) 
, JUMP VARCHAR2(5 BYTE) 
, CLAIRVOYANCE VARCHAR2(5 BYTE) 
, DIMENSIONAL_TRAVEL VARCHAR2(5 BYTE) 
, POWER_SENSE VARCHAR2(5 BYTE) 
, SHAPESHIFTING VARCHAR2(5 BYTE) 
, PEAK_HUMAN_CONDITION VARCHAR2(5 BYTE) 
, IMMORTALITY VARCHAR2(5 BYTE) 
, CAMOUFLAGE VARCHAR2(5 BYTE) 
, ELEMENT_CONTROL VARCHAR2(5 BYTE) 
, PHASING VARCHAR2(5 BYTE) 
, ASTRAL_PROJECTION VARCHAR2(5 BYTE) 
, ELECTRICAL_TRANSPORT VARCHAR2(5 BYTE) 
, FIRE_CONTROL VARCHAR2(5 BYTE) 
, PROJECTION VARCHAR2(5 BYTE) 
, SUMMONING VARCHAR2(5 BYTE) 
, ENHANCED_MEMORY VARCHAR2(5 BYTE) 
, REFLEXES VARCHAR2(5 BYTE) 
, INVULNERABILITY VARCHAR2(5 BYTE) 
, ENERGY_CONSTRUCTS VARCHAR2(5 BYTE) 
, FORCE_FIELDS VARCHAR2(5 BYTE) 
, SELF_SUSTENANCE VARCHAR2(5 BYTE) 
, ANTI_GRAVITY VARCHAR2(5 BYTE) 
, EMPATHY VARCHAR2(5 BYTE) 
, POWER_NULLIFIER VARCHAR2(5 BYTE) 
, RADIATION_CONTROL VARCHAR2(5 BYTE) 
, PSIONIC_POWERS VARCHAR2(5 BYTE) 
, ELASTICITY VARCHAR2(5 BYTE) 
, SUBSTANCE_SECRETION VARCHAR2(5 BYTE) 
, ELEMENTAL_TRANSMOGRIFICATION VARCHAR2(5 BYTE) 
, TECHNOPATH_CYBERPATH VARCHAR2(5 BYTE) 
, PHOTOGRAPHIC_REFLEXES VARCHAR2(5 BYTE) 
, SEISMIC_POWER VARCHAR2(5 BYTE) 
, ANIMATION VARCHAR2(5 BYTE) 
, PRECOGNITION VARCHAR2(5 BYTE) 
, MIND_CONTROL VARCHAR2(5 BYTE) 
, FIRE_RESISTANCE VARCHAR2(5 BYTE) 
, POWER_ABSORPTION VARCHAR2(5 BYTE) 
, ENHANCED_HEARING VARCHAR2(5 BYTE) 
, NOVA_FORCE VARCHAR2(5 BYTE) 
, INSANITY VARCHAR2(5 BYTE) 
, HYPNOKINESIS VARCHAR2(5 BYTE) 
, ANIMAL_CONTROL VARCHAR2(5 BYTE) 
, NATURAL_ARMOR VARCHAR2(5 BYTE) 
, INTANGIBILITY VARCHAR2(5 BYTE) 
, ENHANCED_SIGHT VARCHAR2(5 BYTE) 
, MOLECULAR_MANIPULATION VARCHAR2(5 BYTE) 
, HEAT_GENERATION VARCHAR2(5 BYTE) 
, ADAPTATION VARCHAR2(5 BYTE) 
, GLIDING VARCHAR2(5 BYTE) 
, POWER_SUIT VARCHAR2(5 BYTE) 
, MIND_BLAST VARCHAR2(5 BYTE) 
, PROBABILITY_MANIPULATION VARCHAR2(5 BYTE) 
, GRAVITY_CONTROL VARCHAR2(5 BYTE) 
, REGENERATION VARCHAR2(5 BYTE) 
, LIGHT_CONTROL VARCHAR2(5 BYTE) 
, ECHOLOCATION VARCHAR2(5 BYTE) 
, LEVITATION VARCHAR2(5 BYTE) 
, TOXIN_AND_DISEASE_CONTROL VARCHAR2(5 BYTE) 
, BANISH VARCHAR2(5 BYTE) 
, ENERGY_MANIPULATION VARCHAR2(5 BYTE) 
, HEAT_RESISTANCE VARCHAR2(5 BYTE) 
, NATURAL_WEAPONS VARCHAR2(5 BYTE) 
, TIME_TRAVEL VARCHAR2(5 BYTE) 
, ENHANCED_SMELL VARCHAR2(5 BYTE) 
, ILLUSIONS VARCHAR2(5 BYTE) 
, THIRSTOKINESIS VARCHAR2(5 BYTE) 
, HAIR_MANIPULATION VARCHAR2(5 BYTE) 
, ILLUMINATION VARCHAR2(5 BYTE) 
, OMNIPOTENT VARCHAR2(5 BYTE) 
, CLOAKING VARCHAR2(5 BYTE) 
, CHANGING_ARMOR VARCHAR2(5 BYTE) 
, POWER_COSMIC VARCHAR2(5 BYTE) 
, BIOKINESIS VARCHAR2(5 BYTE) 
, WATER_CONTROL VARCHAR2(5 BYTE) 
, RADIATION_IMMUNITY VARCHAR2(5 BYTE) 
, VISION_TELESCOPIC VARCHAR2(5 BYTE) 
, TOXIN_AND_DISEASE_RESISTANCE VARCHAR2(5 BYTE) 
, SPATIAL_AWARENESS VARCHAR2(5 BYTE) 
, ENERGY_RESISTANCE VARCHAR2(5 BYTE) 
, TELEPATHY_RESISTANCE VARCHAR2(5 BYTE) 
, MOLECULAR_COMBUSTION VARCHAR2(5 BYTE) 
, OMNILINGUALISM VARCHAR2(5 BYTE) 
, PORTAL_CREATION VARCHAR2(5 BYTE) 
, MAGNETISM VARCHAR2(5 BYTE) 
, MIND_CONTROL_RESISTANCE VARCHAR2(5 BYTE) 
, PLANT_CONTROL VARCHAR2(5 BYTE) 
, SONAR VARCHAR2(5 BYTE) 
, SONIC_SCREAM VARCHAR2(5 BYTE) 
, TIME_MANIPULATION VARCHAR2(5 BYTE) 
, ENHANCED_TOUCH VARCHAR2(5 BYTE) 
, MAGIC_RESISTANCE VARCHAR2(5 BYTE) 
, INVISIBILITY VARCHAR2(5 BYTE) 
, SUB_MARINER VARCHAR2(5 BYTE) 
, RADIATION_ABSORPTION VARCHAR2(5 BYTE) 
, INTUITIVE_APTITUDE VARCHAR2(5 BYTE) 
, VISION_MICROSCOPIC VARCHAR2(5 BYTE) 
, MELTING VARCHAR2(5 BYTE) 
, WIND_CONTROL VARCHAR2(5 BYTE) 
, SUPER_BREATH VARCHAR2(5 BYTE) 
, WALLCRAWLING VARCHAR2(5 BYTE) 
, VISION_NIGHT VARCHAR2(5 BYTE) 
, VISION_INFRARED VARCHAR2(5 BYTE) 
, GRIM_REAPING VARCHAR2(5 BYTE) 
, MATTER_ABSORPTION VARCHAR2(5 BYTE) 
, THE_FORCE VARCHAR2(5 BYTE) 
, RESURRECTION VARCHAR2(5 BYTE) 
, TERRAKINESIS VARCHAR2(5 BYTE) 
, VISION_HEAT VARCHAR2(5 BYTE) 
, VITAKINESIS VARCHAR2(5 BYTE) 
, RADAR_SENSE VARCHAR2(5 BYTE) 
, QWARDIAN_POWER_RING VARCHAR2(5 BYTE) 
, WEATHER_CONTROL VARCHAR2(5 BYTE) 
, VISION_X_RAY VARCHAR2(5 BYTE) 
, VISION_THERMAL VARCHAR2(5 BYTE) 
, WEB_CREATION VARCHAR2(5 BYTE) 
, REALITY_WARPING VARCHAR2(5 BYTE) 
, ODIN_FORCE VARCHAR2(5 BYTE) 
, SYMBIOTE_COSTUME VARCHAR2(5 BYTE) 
, SPEED_FORCE VARCHAR2(5 BYTE) 
, PHOENIX_FORCE VARCHAR2(5 BYTE) 
, MOLECULAR_DISSIPATION VARCHAR2(5 BYTE) 
, VISION_CRYO VARCHAR2(5 BYTE) 
, OMNIPRESENT VARCHAR2(5 BYTE) 
, OMNISCIENT VARCHAR2(5 BYTE) 
);