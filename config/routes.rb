Rails.application.routes.draw do

  get 'schedule' => 'schedule#weekly_schedule'
end
