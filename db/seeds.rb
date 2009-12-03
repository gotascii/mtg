["Red",
"Green",
"White",
"Blue",
"Black",
"Artifact",
"Land",
"Multi"].each do |name|
  Color.create(:name => name)
end

[["M2010", "M10", "Magic_2010_Common.gif"],
["Zendikar", "ZK", "Zendikar_Common.gif"],
["Conflux", "CF", "Conflux_Common.gif"],
["9th Core", "IX", "Exp_sym_9th.png"],
["10th Ed", "X", "Exp_sym_10th.png"],
["Fallen Empires", "FE", "Exp_sym_fallenempires.png"],
["Shards of Alara", "SA", "20px-Shards_of_Alara.png"],
["Alara Reborn", "AR", "Alara_Reborn_Common.gif"],
["Shadowmoor", "SM", "21px-Exp_sym_shadowmoor.png"],
["Morningtide", "MT", "20px-Exp_sym_morningtide.png"]].each do |name, abbr, icon|
  e = Expansion.find_or_create_by_name_and_abbr(name, abbr)
  e.icon = icon
  e.save
end