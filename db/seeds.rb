# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Tag.destroy_all

t1 = Tag.create(name: 'html')
t2 = Tag.create(name: 'css')
t3 = Tag.create(name: 'rails')

puts "#{Tag.count} tags in the database"

Note.destroy_all

n1 = Note.create(contents: "Html is used with css")
n2 = Note.create(contents: "Rails also uses html")
n3 = Note.create(contents: "Rails is used to build dynamic web applications")

puts "#{Note.count} notes in the database"


TagAssociation.destroy_all

ta1 = TagAssociation.create(tag_id: t1.id, note_id: n1.id)
ta2 = TagAssociation.create(tag_id: t2.id, note_id: n1.id)
ta3 = TagAssociation.create(tag_id: t1.id, note_id: n2.id)
ta4 = TagAssociation.create(tag_id: t3.id, note_id: n2.id)
ta5 = TagAssociation.create(tag_id: t3.id, note_id: n3.id)

puts "#{TagAssociation.count} tag associations in the database"
