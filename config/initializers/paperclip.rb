# TODO not sure this needs to be comment out??? just trying to get it to work
# Paperclip::Attachment.default_options[:url] = ENV['BUCKET_URL']
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
