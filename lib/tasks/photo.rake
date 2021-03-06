namespace :photo do
  desc "TODO"
  task copy: :environment do
    response1 = HTTParty.get("https://my.tikee.io/v2/photo_sets/b5c0711e-b6f1-4d91-aa2d-55db20b47eec/last_signed_url", headers: { 
      "Accept" => "application/json" })
    data1 = response1.to_hash
    photo = Photo.new
    photo.url = data1['url']['url']['original']
    file = URI.open(photo.url)
    photo.date = data1['url']['date']
    photo.number = data1['count']
    photo.photo_set = 'b5c0711e-b6f1-4d91-aa2d-55db20b47eec'
    photo.camera = 'vita_1'
    photo.image.attach(io: file, filename: photo.camera, content_type: 'image/jpg')
    photo.save
  
    response2 = HTTParty.get("https://my.tikee.io/v2/photo_sets/02a65610-6e86-4917-acd1-084415428d92/last_signed_url", headers: { 
      "Accept" => "application/json" })
    data2 = response2.to_hash
    photo2 = Photo.new
    photo2.url = data2['url']['url']['original']
    file2 = URI.open(photo2.url)
    photo2.date = data2['url']['date']
    photo2.number = data2['count']
    photo2.photo_set = '02a65610-6e86-4917-acd1-084415428d92'
    photo2.camera = 'vita_2'
    photo2.image.attach(io: file2, filename: photo2.camera, content_type: 'image/jpg')
    photo2.save
  end

end
