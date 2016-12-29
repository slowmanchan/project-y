FactoryGirl.define do
  factory :notification do
    recipient_id 1
    actor_id 1
    read_at "2016-12-28 04:16:38"
    action "MyString"
    notifiable_id 1
    notifiable_type "MyString"
  end
end
