Rails.application.routes.draw do
  mount HyperMesh::Engine => '/rr'
  root 'home#show'
end
