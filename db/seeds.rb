Agence.destroy_all
User.destroy_all
Owner.destroy_all
House.destroy_all

agence = Agence.create({
juridic_form: "SARL",
social_denomination: "Immo agence SARL",
enseigne_name: "Immo agence",
email: "contact@immo.com",
phone_number: "0101010101",
fax: "0101010101",
address: "16 Villa Gaudelet",
city: "Paris",
director_first_name: "Charles",
director_last_name: "Gotty",
director_card_number: "010101",
director_card_date: "01/10/16",
director_card_city: "Paris",
vat_number: "010101",
siren_number: "010101",
insurance_number: "010101",
social_capital: "100 000",
professional_card_mention: "Gestion",
civil_respons_insurance_name: "AXA",
civil_respons_insurance_address: "94 Boulevard Beaumarchais",
civil_respons_police_number: "010101011",
civil_respons_police_geo_zone: "France"
})

email = %w"julien@start-immo.fr charles@start-immo.fr mateo@start-immo.fr nico@start-immo.fr"
first_name = %w"Julien Charles Mateo Nico"
last_name = %w"Mottet Gotty Ceron Meyer"

4.times do |i|
  User.create( {
    email: email[i],
    first_name: first_name[i],
    last_name: last_name[i],
    password: "123456",
    phone_number: "0101010101",
    attes_collab_number: "0101010101",
    attes_collab_number_date: "0101010101",
    attes_collab_number_city: "0101010101",
    agence: agence
  })
end

owner_one  = Owner.create( {
  first_name: "Boris",
  last_name: "Paillard",
  email: "boris@lewagon.fr",
  phone_number: "0101010101",
  address: "16 Villa Gaudelet",
  birth_date: "01/01/01",
  birth_place: "Paris",
  is_business: false
})

owner_two = Owner.create( {
  first_name: "Seb",
  last_name: "Saunier",
  email: "seb@lewagon.fr",
  phone_number: "0101010101",
  address: "16 Villa Gaudelet",
  birth_date: "01/01/01",
  birth_place: "Paris",
  is_business: false
})

10.times do |i|
  House.create({
    owner: Owner.all.sample,
    user: User.all.sample,
    price: [100_000, 200_000, 300_000, 400_000].sample,
    address: ["5 rue des bobos","2 rue gambetta", "20 rue menilmontant", "16 calle de la noche"].sample,
    description: "Belle maison",
    house_type: %w"Maison Appartement".sample,
    smoke_detector_presence: true,
    nb_rooms: rand(1..4),
    nb_bedrooms: rand(1..4),
    nb_livingrooms: rand(1..4),
    nb_diningrooms: rand(1..4),
    nb_bathrooms: rand(1..4),
    equiped_kitchen: true,
    nb_showers: rand(1..4),
    nb_bathtubs:rand(1..4),
    nb_terraces:rand(1..4),
    nb_balconies:rand(1..4),
    surface_living: rand(50..150),
    surface_Carrez: rand(50..150),
    surface_total: rand(50..150),
    dpe_done: true,
    energy_consumption: 100,
    ges_emission: 100
  })
end

mandat = DocumentType.create({
  name: "Mandat de vente"
})

avenant_prix = DocumentType.create({
  name: "Avenant au mandat de vente -> Prix",
  data_type_changed: "price"

})
