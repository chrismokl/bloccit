FactoryGirl.define do
	factory :post do
		title "First Post"
		body "This is the newest post. it needs 20 char to be saved."
		user
		topic
	end
end