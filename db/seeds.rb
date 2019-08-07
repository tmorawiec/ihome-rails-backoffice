# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    PermissionPolicy.create!([
        {name: 'pełny dostęp', io1: true, io2: true, io3: true, io4: true},
        {name: 'brak dostępu', io1: false, io2: false, io3: false, io4: false}
    ])

    User.create!([
        {email: "user1@example.com", password: "12345678", password_confirmation: "12345678", admin: true, permission_policy_id: 1},
        {email: "user2@example.com", password: "12345678", password_confirmation: "12345678", admin: false, permission_policy_id: 2},
        {email: "user3@example.com", password: "12345678", password_confirmation: "12345678", admin: false, permission_policy_id: 2},
        {email: "user4@example.com", password: "12345678", password_confirmation: "12345678", admin: false, permission_policy_id: 2},
    ])