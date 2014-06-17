FactoryGirl.define do
	factory :user do
		name "Douglas Murray"
		sequence(:email, 100) {|n| "person#{n}@example.com"}
		password "hellohello"
		password_confirmation "hellohello"
		confirmed_at Time.now
	end
end