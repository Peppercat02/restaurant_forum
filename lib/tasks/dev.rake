namespace :dev do

    task fake: :environment do
        Restaurant.destroy_all

        500.times do |i|
            Restaurant.create!(
                name: FFaker::Name.first_name,
                opening_hours: FFaker::Time.datetime,
                tel: FFaker::PhoneNumber.short_phone_number,
                address: FFaker::Address.street_address,
                description: FFaker::Lorem.paragraph,
                category: Category.all.sample
            )
        end
        puts "have created fake restaurants"
        puts "now you have #{Restaurant.count} restaurants data"
    end

    task fake_user: :environment do
        User.destroy_all
        20.times do |i|
            User.create!(
                email: FFaker::Internet.email,
                encrypted_password: FFaker::Internet.password
            )
        end
        puts "have created fake Users"
        puts "now you have #{User.count} users data"
    end

    # task fake_comment: :environment do
    #     Comment.destroy_all
    #     20.times do |i|
    #         content: FFaker::content.content,
    #         restaurant_id: FFaker::restaurant_id.restaurant_id,
    #         user_id: FFaker::user_id.user_id
    #     end
    #     puts "have created fake Comments"
    #     puts "now you have #{Comment.count} Comments data"
    # end
end
