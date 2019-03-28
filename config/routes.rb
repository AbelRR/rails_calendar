Rails.application.routes.draw do

  get 'schedule' => 'schedule#weekly_schedule'
  get 'students' => 'students#get_students'
end
