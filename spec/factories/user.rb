FactoryGirl.define do
	factory :user do
		name "Douglas Murray"
		email "douglas@example.com"
		password "hellohello"
		password_confirmation "hellohello"
		confirmed_at Time.now
	end
end