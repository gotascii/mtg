["Red",
"Green",
"White",
"Blue",
"Black",
"None"].each do |name|
  Color.create(:name => name)
end

[["M2010", "M10", "magic-2010-m10-core-set-common.gif"],
["Zendikar", "ZEN", "Zendikar_Common.gif"],
["Conflux", "CON", "Conflux_Common.gif"],
["9th Core", "9ED", "Exp_sym_9th.png"],
["10th Ed", "10E", "Exp_sym_10th.png"],
["Fallen Empires", "FEM", "Exp_sym_fallenempires.png"],
["Shards of Alara", "ALA", "20px-Shards_of_Alara.png"],
["Alara Reborn", "ARB", "Alara_Reborn_Common.gif"],
["Shadowmoor", "SHM", "21px-Exp_sym_shadowmoor.png"],
["Morningtide", "MOR", "20px-Exp_sym_morningtide.png"],
["Eventide", "EVE", "21px-Exp_sym_eventide.png"],
["Planar Chaos", "PLC", "Exp_sym_planarchaos.png"],
["Lorwyn", "LRW", "Exp_sym_lorwyn.png"],
["Dissension", "DIS", "Exp_sym_dissension.png"],
["Time Spiral", "TSP", "Exp_sym_timespiral.png"]].each do |name, abbr, icon|
  e = Expansion.find_or_create_by_name(name)
  e.abbr = abbr
  e.icon = icon
  e.save
end

[["Creature", "C"],
["Instant", "I"],
["Sorcery", "S"],
["Enchantment", "E"],
["Land", "L"],
["Artifact", "A"],
["Planeswalker", "P"]].each do |name, abbr|
  ct = CardType.find_or_create_by_name(name)
  ct.abbr = abbr
  ct.save
end