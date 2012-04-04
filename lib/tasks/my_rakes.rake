namespace :db do
	desc "Import Artists" 
		task :import_artists => :environment do
			File.open(/public, "artists.txt", "r").each_line do |line|
				name = line
				artist = Artist.new(:name => name)
				artist.save
			end
		end
	end
end