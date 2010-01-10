Card.all.each do |card|
  mc = Magiccards.new(card.name)
  card.image_url = mc.image_url
  card.save!
end