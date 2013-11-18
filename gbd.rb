require 'rubygems'
require 'open-uri'
require 'zip'


puts "link"
link = gets.chomp
puts "Name"
DATA_DIR = gets.chomp 
Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)
#Uses a .jar file to download pages from google books
`java -jar GoogleBooksDownloader.jar "#{link}"  "/home/luis/googlebooksdownloader/#{DATA_DIR}"`

#creates a .zip file

issue_dirzip = DATA_DIR + "/"
 
 zipfile_name = "/home/luis/googlebooksdownloader/" + DATA_DIR + ".zip"
Zip::ZipFile.open(zipfile_name, Zip::ZipFile::CREATE) do |zipfile|
    Dir[File.join(issue_dirzip, '**', '**')].each do |file|
      zipfile.add(file.sub(issue_dirzip, ''), file)
    end
end

puts "done"
