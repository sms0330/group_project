# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Course.destroy_all
Facility.destroy_all
Enroll.destroy_all

PASSWORD='supersecret'
super_user=User.create(
    first_name: 'Jon',
    last_name: 'Snow',
    email: 'js@winterfell.gov',
    password: PASSWORD,
    is_teacher: true,
    is_admin: true
)

20.times do
    first_name=Faker::Name.first_name
    last_name=Faker::Name.last_name
    User.create(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name}.#{last_name}@example.com",
        password: PASSWORD,
        is_teacher: [true, false].sample
    )
end
users=User.all

100.times do
    created_at = Faker::Date.backward(days:365 * 5)
    c = Course.create(
        name: Faker::Educator.subject,
        category: Faker::Educator.course_name,
        description: Faker::ChuckNorris.fact,
        seats: Faker::Number.number(digits: 2),
        start_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
        end_date: Faker::Date.between(from: '2021-09-01', to: '2021-12-25'),
        time: '09:00:00',
        # course_code:  Faker::Number.number(digits: 3),
        created_at: created_at,
        updated_at: created_at,
        user: users.sample
    )

    c.enrollers = users.shuffle.slice(0, rand(users.count))

end

10.times do
    created_at = Faker::Date.backward(days:365 * 5)
    Facility.create(
        name: Faker::Educator.campus,
        book: [true, false].sample,
        created_at: created_at,
        updated_at: created_at,
        user: users.sample
    )
end

facilities = Facility.all
courses = Course.all

puts "Generated #{courses.count} courses"
puts "Generated #{facilities.count} facilities"
puts "Generated #{users.count} users"
puts "Generated #{Enroll.count} enrolled student"
