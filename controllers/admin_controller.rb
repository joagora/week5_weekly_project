require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/training')
require_relative('../models/horse')
require_relative('../models/trainer')
require_relative('../models/owner')



get '/admin' do
  erb :"admin/index"
end

get '/owners/:id/owners_horses' do
  owner = Owner.find(params['id'])
  @horses_by_owner = owner.horses
  erb :"admin/owners_horses"
end
