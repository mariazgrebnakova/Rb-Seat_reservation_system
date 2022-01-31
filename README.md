# Rb - Seat reservation app

Live demo: http://ruby-seat-reservation-project.herokuapp.com

## Dependencies

Ruby version: 3.0.0
PostgreSQL: 12.9

## Configuration

First set up database:
`rake db:migrate`

Then update gems by:
`bundle install`

Create first department, user_type and admin user:
```rails c
Department.new(name: 'IT Support', code:'IT').save!
UserType.new(name: 'Administrator').save!
User.new(first_name: 'Hubert', last_name:'Sampan',is_admin:true, department_id: 1, user_type_id: 1, email: 'hubert@admin.com', password:'hubertistheboss').save!
```

Start server by running:
`rails s`

## Tests

Run tests by:
`rspec`
