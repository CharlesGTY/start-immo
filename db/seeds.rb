Agence.destroy_all
User.destroy_all
Owner.destroy_all

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
social_capital: "100000",
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
    phone_number: "0101010101",
    attes_collab_number: "0101010101",
    attes_collab_number_date: "0101010101",
    attes_collab_number_city: "0101010101",
    agence: agence
  })
end

Owner.create( {
  first_name: "Boris",
  last_name: "Paillard",
  email: "boris@lewagon.fr",
  phone_number: "0101010101",
  address: "16 Villa Gaudelet",
  birth_date: "01/01/01",
  birth_place: "Paris",
  is_business: false
})

Owner.create( {
  first_name: "Seb",
  last_name: "Saunier",
  email: "seb@lewagon.fr",
  phone_number: "0101010101",
  address: "16 Villa Gaudelet",
  birth_date: "01/01/01",
  birth_place: "Paris",
  is_business: false
})
