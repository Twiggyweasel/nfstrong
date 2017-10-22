require 'faker'
Event.create! slug: '2017-5k-Walk-kansas-city', category: '5K Walk', goal: 10_000_0, raised: 200_00, event_start: '2017-12-20 08:00:00', event_stop: '2017-12-20 10:00:00', venue_name: 'Stump Park', street: '4751 Woodland Dr', city: 'Shawnee', state: 'KS', zipcode: '66218', has_donations: true, has_sponsors: true, has_fundraisers: true, has_shirts: true, is_private: false, is_published: true, active: true, created_at: '2017-06-08 18:49:58', updated_at: '2017-07-06 16:34:12'
Event.create! slug: '2017-5k-Walk-Nashville', category: '5K Walk', goal: 5_000_0, raised: 1_500_00, event_start: '2017-11-10 08:00:00', event_stop: '2017-11-10 10:00:00', venue_name: 'Stump Park', street: '4751 Woodland Dr', city: 'Shawnee', state: 'KS', zipcode: '66218', has_donations: true, has_sponsors: true, has_fundraisers: true, has_shirts: true, is_private: true, is_published: true, active: true, created_at: '2017-06-08 18:49:58', updated_at: '2017-07-06 16:34:12'

Activity.create! name: 'Silent Auction', event_id: 1
Activity.create! name: 'Kids Bouncey House', event_id: 1
Activity.create! name: 'Live Music', event_id: 1
Activity.create! name: 'Door Prizes', event_id: 1
Activity.create! name: 'Face Painting', event_id: 1

100.times do
  User.create! name: Faker::Name.name
end

100.times do
  user = rand(1..100)
  Registration.create! fee: 25.0, shirt_size: 'medium', event_id: rand(1..2), user_id: user, accepted_terms: true
end