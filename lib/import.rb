Card.all.each do |card|
  mc = Magiccards.new(card.name)
  card.image_url = mc.image_url
  card.cmc = mc.cmc
  card.save!
  sleep(0.2)
end