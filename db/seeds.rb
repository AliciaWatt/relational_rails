# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Coach.destroy_all
# Athlete.destroy_all

@doc = Coach.create!(name: 'Doc McStuffins', club: "Bruins", recruiting_athletes: true, years_experience: 20)
@franklin = Coach.create!(name: "Missy Franklin", club: "Dolphins", recruiting_athletes: true, years_experience: 2)
@federer = Coach.create!(name: "Roger Federer", club: "Aces", recruiting_athletes: true, years_experience: 15)
@mac = Coach.create!(name: "Mac Demarco", club: "Boomers", recruiting_athletes: true, years_experience: 10)

@mayo = @franklin.athletes.create!(name: 'Jo Mayo', rank: 2, championship_qualifier: true)
@phelps = @franklin.athletes.create!(name: 'Michael Phelps', rank: 1, championship_qualifier: true)
@valencia = @franklin.athletes.create!(name: 'Emily valencia', rank: 16, championship_qualifier: false)
@stanski = @doc.athletes.create!(name: 'Staniel Stanski', rank: 3, championship_qualifier: true)
@andrews = @doc.athletes.create!(name: 'Merk Andrews', rank: 12, championship_qualifier: false)
@otter = @doc.athletes.create!(name: 'Yannik Otter', rank: 4, championship_qualifier: true)
@barbu = @federer.athletes.create!(name: 'Mihai Barbu', rank: 5, championship_qualifier: true)
@moons = @federer.athletes.create!(name: 'Meg Moons', rank: 22, championship_qualifier: false)
@opelka = @federer.athletes.create!(name: 'Reilly Opelka', rank: 6, championship_qualifier: true)
@fritz = @mac.athletes.create!(name: 'Taylor Fritz', rank: 7, championship_qualifier: true)
@ferguson = @mac.athletes.create!(name: 'Terd Ferguson', rank: 45, championship_qualifier: false)
@sakkari = @mac.athletes.create!(name: 'Maria Sakkari', rank:8, championship_qualifier: true)
