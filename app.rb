require_relative 'classes/nameable'
require_relative 'classes/person'
require_relative 'classes/student'
require_relative 'classes/teacher'
require_relative 'classes/decorator'
require_relative 'classes/capitalize_decorator'
require_relative 'classes/trimmer_decorator'
require_relative 'classes/book'
require_relative 'classes/rental'
require_relative 'classes/classroom'

person = Person.new(22, 'maximilianus')
person2 = Person.new(24, 'Julian')
person3 = Person.new(32, 'Hanna')

book1 = Book.new('Simon Bolivar', 'Arturo Fuentes')
book2 = Book.new('Abraham Lincoln', 'Vanessa Lee')

book1.add_rental(Rental.new('2023-01-01', book1, person))
book2.add_rental(Rental.new('2023-01-01', book2, person))
book2.add_rental(Rental.new('2023-01-03', book2, person2))
person3.add_rental(Rental.new('2023-02-12', book1, person3))
person2.add_rental(Rental.new('2023-03-06', book1, person2))

p "books rented by #{person.name}:"
person.rentals.each { |ren| p [ren.date, ren.book.title, ren.book.author] }
p "books rented by #{person2.name}:"
person2.rentals.each { |ren| p [ren.date, ren.book.title, ren.book.author] }
p "books rented by #{person3.name}:"
person3.rentals.each { |ren| p [ren.date, ren.book.title, ren.book.author] }
p "people who rented #{book1.title} by #{book1.author}:"
book1.rentals.each { |ren| p [ren.date, ren.person.name] }
p "people who rented #{book2.title} by #{book2.author}:"
book2.rentals.each { |ren| p [ren.date, ren.person.name] }
