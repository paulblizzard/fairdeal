# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Factor.destroy_all

Factor.create! [
	{ title: "Factor 1", content: "Purpose of the dealing."},
	{ title: "Factor 2", content: "Character of the dealing."},
	{ title: "Factor 3", content: "Amount of the dealing."},
	{ title: "Factor 4", content: "Alternatives to the dealing."},
	{ title: "Factor 5", content: "Nature of the work."},
	{ title: "Factor 6", content: "Effect of the dealing on the work."}
]

Question.destroy_all

f1 = Factor.find_by title: "Factor 1"

f1.questions.create! [
	{ title: "Question 1a", content: "(A)What is the purpose of the dealing?"},
	{ title: "Question 1b", content: "(B)What is the purpose of the dealing?"}
]

f2 = Factor.find_by	title: "Factor 2"

f2.questions.create! [
	{ title: "Question 2", content: "What is the character of the dealing?"}
]

f3 = Factor.find_by	title: "Factor 3"

f3.questions.create! [
	{ title: "Question 3", content: "What is the amount of the dealing?"}
]

f4 = Factor.find_by	title: "Factor 4"

f4.questions.create! [
	{ title: "Question 4", content: "What are the alternatives to the dealing?"}
]

f5 = Factor.find_by	title: "Factor 5"

f5.questions.create! [
	{ title: "Question 5", content: "What is the nature of the work?"}
]

f6 = Factor.find_by	title: "Factor 6"


f6.questions.create! [
	{ title: "Question 6", content: "What is the effect of the dealing on the work?"}
]

Answer.destroy_all

