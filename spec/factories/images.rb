FactoryGirl.define do
  factory :image do
    album
    picture { File.new("#{Rails.root}/spec/fixtures/albums/images/south_park.jpg") }
  end
end
