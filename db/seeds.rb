House.destroy_all
User.destroy_all
Agence.destroy_all
Owner.destroy_all
DocumentType.destroy_all

agence = Agence.create({
juridic_form: "SARL",
social_denomination: "Immo agence SARL",
enseigne_name: "Immo agence",
email: "contact@immo.com",
phone_number: "0610819121",
fax: "0109819121",
address: "16 Villa Gaudelet",
city: "Paris",
director_first_name: "Charles",
director_last_name: "Gotty",
director_card_number: "0192837",
director_card_date: "01/10/16",
director_card_city: "Paris",
vat_number: "0192671",
siren_number: "065432",
insurance_number: "045678",
social_capital: "100 000",
professional_card_mention: "Gestion",
civil_respons_insurance_name: "AXA",
civil_respons_insurance_address: "94 Boulevard Beaumarchais",
civil_respons_police_number: "0645342567",
civil_respons_police_geo_zone: "France"
})

agence2 = Agence.create({
juridic_form: "SARL",
social_denomination: "Immo agence SARL",
enseigne_name: "Immo Super",
email: "contact@immo.com",
phone_number: "0610889121",
fax: "0109819145",
address: "16 Villa Gaudelet",
city: "Paris",
director_first_name: "Charles",
director_last_name: "Gotty",
director_card_number: "065432",
director_card_date: "01/10/16",
director_card_city: "Paris",
vat_number: "045578",
siren_number: "045612",
insurance_number: "045678",
social_capital: "100 000",
professional_card_mention: "Gestion",
civil_respons_insurance_name: "AXA",
civil_respons_insurance_address: "94 Boulevard Beaumarchais",
civil_respons_police_number: "0645819121",
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

names = ["Boris Paillard", "Seb Saunier", "Edward Schults", "Kevin Robert", "Brice Boulesteix", "Tanguy Foujols", "Benoit Morin", "Remi Mercier", "Elsa Szymczak", "Baptiste Boucher"]

10.times do |i|
  Owner.create({
    first_name: names[i].split[0],
    last_name: names[i].split[1],
    email: "#{names[i].split[0].downcase}@lewagon.fr",
    phone_number: "0146125673",
    address: "16 Villa Gaudelet",
    birth_date: "01/01/01",
    birth_place: "Paris",
    is_business: false
  })
end

30.times do |i|
  House.create({
    owner: Owner.all[i],
    user: User.all.sample,
    price: [100_000, 200_000, 300_000, 400_000].sample,
    address: ["5 Rue Riquet, Paris", "34 Rue Legendre, Paris", "15 Rue de Rochechouart, Paris", "12 rue Mademoiselle, Paris","328 Rue de Vaugirard, Paris","122 Boulevard Murat, Paris","14 Rue Crespin du Gast, Paris","1 Port de la Rapée, Paris", "16 Villa Gaudelet, Paris","2 rue Houdart, Paris", "20 rue menilmontant, Paris", "5 rue du Borrego, Paris","44 Rue des Vinaigriers, 75010 Paris","23 Rue Mazarine, 75006 Paris","34 Rue Duperré, 75009 Paris","51 Quai des Grands Augustins, 75006 Paris","10 Rue de Bruxelles, 75009 Paris","21 Rue Saint-Sauveur, 75002 Paris","19 Avenue Kléber, 75116 Paris", "3 Rue Oberkampf, 75011 Paris"][i],
    description: "A vendre",
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
    exclusive: [true, false].sample,
    energy_consumption: 100,
    ges_emission: 100,
    photo: File.open("photo#{rand(1..10)}.jpeg")
  })
end

mandat = DocumentType.create({
  name: "Mandat de vente"
})

avenant_prix = DocumentType.create({
  name: "Avenant au mandat de vente -> Prix",
  data_type_changed: "price"

})
