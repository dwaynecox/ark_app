json.partial! @dollar, partial: 'dollar', as: :dollar
json.arks do 
  json.array! @dollar.arks, partial: '/api/arks/ark', as: :ark
end