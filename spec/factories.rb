FactoryGirl.define do 
	factory :user do
		sequence(:nickname) { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com" }
		password "tigeriss"
		password_confirmation "tigeriss"

		factory :admin do
			admin true
		end
	end

	factory :micropost do
		content "lorem ipsum"
		user
	end	

end