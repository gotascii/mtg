["Red",
"Green",
"White",
"Blue",
"Black",
"Artifact",
"Land",
"Multi"].each do |name|
  Color.create!(:name => name)
end

[["M2010", "M10"],
["Zendikar", "ZK"],
["Conflux", "CF"],
["9th Core", "IX"],
["10th Ed", "X"]].each do |name, abbr|
  Expansion.create!(:name => name, :abbr => abbr)
end