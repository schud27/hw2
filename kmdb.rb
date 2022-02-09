# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Movie.destroy_all
Person.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model
# TODO!

# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.
# TODO!

# insert People

christopher_nolan = Person.new({ name: "Christopher Nolan" })
christopher_nolan.save

christian_bale = Person.new({ name: "Christian Bale" })
christian_bale.save

michael_caine = Person.new({ name: "Michael Caine" })
michael_caine.save

liam_neeson = Person.new({ name: "Liam Neeson" })
liam_neeson.save

katie_holmes = Person.new({ name: "Katie Holmes" })
katie_holmes.save

gary_oldman = Person.new({ name: "Gary Oldman" })
gary_oldman.save

heath_ledger = Person.new({ name: "Heath Ledger" })
heath_ledger.save

aaron_eckhart = Person.new({ name: "Aaron Eckhart" })
aaron_eckhart.save

maggie_gyllenhaal = Person.new({ name: "Maggie Gyllenhaal" })
maggie_gyllenhaal.save

tom_hardy = Person.new({ name: "Tom Hardy" })
tom_hardy.save

joseph_gordon_levitt = Person.new({ name: "Joseph Gordon-Levitt" })
joseph_gordon_levitt.save

anne_hathaway = Person.new({ name: "Anne Hathaway" })
anne_hathaway.save

# insert Movies
values = { title: "Batman Begins", year_released: 2005, rated: "PG-13", person_id: christopher_nolan.id }
batman_begins = Movie.new(values)
batman_begins.save

values = { title: "The Dark Knight", year_released: 2008, rated: "PG-13", person_id: christopher_nolan.id }
dark_knight = Movie.new(values)
dark_knight.save

values = { title: "The Dark Knight Rises", year_released: 2012, rated: "PG-13", person_id: christopher_nolan.id }
dark_knight_rises = Movie.new(values)
dark_knight_rises.save

# #insert Roles
bruce_wayne = Role.new({person_id: christian_bale.id, movie_id: batman_begins.id, character_name: "Bruce Wayne", })
bruce_wayne.save

alfred = Role.new({person_id: michael_caine.id, movie_id: batman_begins.id, character_name: "Alfred", })
alfred.save

ras_al_ghul = Role.new({person_id: liam_neeson.id, movie_id: batman_begins.id, character_name: "Ra's Al Ghul", })
ras_al_ghul.save

rachel_dawes = Role.new({person_id: katie_holmes.id, movie_id: batman_begins.id, character_name: "Rachel Dawes", })
rachel_dawes.save

commissioner_gordon = Role.new({person_id: gary_oldman.id, movie_id: batman_begins.id, character_name: "Commissioner Gordon", })
commissioner_gordon.save

bruce_wayne = Role.new({person_id: christian_bale.id, movie_id: dark_knight.id, character_name: "Bruce Wayne", })
bruce_wayne.save

joker = Role.new({person_id: heath_ledger.id, movie_id: dark_knight.id, character_name: "Joker", })
joker.save

harvey_dent = Role.new({person_id: aaron_eckhart.id, movie_id: dark_knight.id, character_name: "Harvey Dent", })
harvey_dent.save

alfred = Role.new({person_id: michael_caine.id, movie_id: dark_knight.id, character_name: "Alfred", })
alfred.save

rachel_dawes = Role.new({person_id: maggie_gyllenhaal.id, movie_id: dark_knight.id, character_name: "Rachel Dawes", })
rachel_dawes.save

bruce_wayne = Role.new({person_id: christian_bale.id, movie_id: dark_knight_rises.id, character_name: "Bruce Wayne", })
bruce_wayne.save

commissioner_gordon = Role.new({person_id: gary_oldman.id, movie_id: dark_knight_rises.id, character_name: "Commissioner Gordon", })
commissioner_gordon.save

bane = Role.new({person_id: tom_hardy.id, movie_id: dark_knight_rises.id, character_name: "Bane", })
bane.save

john_blake = Role.new({person_id: joseph_gordon_levitt.id, movie_id: dark_knight_rises.id, character_name: "John Blake", })
john_blake.save

selina_kyle = Role.new({person_id: anne_hathaway.id, movie_id: dark_knight_rises.id, character_name: "Selina Kyle", })
selina_kyle.save


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie
# TODO!
