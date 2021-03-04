# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

#every 10.minutes do
#  response1 = HTTParty.get("https://my.tikee.io/v2/photo_sets/b5c0711e-b6f1-4d91-aa2d-55db20b47eec/last_signed_url", headers: { 
#    "Accept" => "application/json" })
#  data1 = response1.to_hash
#  photo = Photo.new
#  photo.url = data1['url']['url']['original']
#  photo.date = data1['url']['date']
#  photo.number = data1['count']
#  photo.photo_set = 'b5c0711e-b6f1-4d91-aa2d-55db20b47eec'
#  photo.camera = 'vita_1'
#  photo.image.attach(io: photo.url, filename: photo.camera)
#  photo.save
#end