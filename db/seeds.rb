# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Toilet.destroy_all
User.destroy_all
puts "Creating users..."

# create user with email and password

ActiveRecord::Base.connection.reset_pk_sequence!(Toilet.table_name)
ActiveRecord::Base.connection.reset_pk_sequence!(User.table_name)

user_email = ['lou.phil@gpail.com', 'philipD@yohoo.co.uk', 'IPFreely@geocities.com', 'HoldenEtienne@gpail.com', 'got2go@gpail.co.uk' ]

User.create!(
email: 'lou.phil@gpail.com',
password: 123456
)
User.create!(
email: 'philipD@yohoo.co.uk',
password: 123456
)
User.create!(
email: 'IPFreely@geocities.com',
password: 123456
)
User.create!(
email: 'HoldenEtienne@gpail.com',
password: 123456
)

IMAGES = ['7f421df1218040a77307602874ea0168.jpg', '96dfc12e38f1ee5ff19c2881884bf086.jpg', '1178_Housekeepers_Bucket_Galvanised_2ed7c916-95d8-447d-962e-9828edcadddf_grande.jpg', '44187704_05608a38cb.jpg', 'royal-style-gold-toilet-5.jpg']


puts "Creating Toilets..."

30.times do
  toilet = Toilet.create!(
    location: Faker::Address.street_address,
    description: Faker::Books::Lovecraft.paragraph(sentence_count: 3),
    cost_per_minute: rand(1..5),
    access_info: Faker::Books::Lovecraft.sentence,
    user: User.find(rand(1..4)),
    image_path: IMAGES.sample
   )
    puts "Created toilet with id #{toilet.id}"
end
