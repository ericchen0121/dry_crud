class Note < ActiveRecord::Base

	def self.data(id)
		note = self.find(id)
		{id: note.id, title: note.title, content: note.content}
	end

	def self.all_data
		all_notes = []; self.all.each {|note| all_notes << note.data }; all_notes		
	end
	
	def data
		{id: self.id, title: self.title, content: self.content}
	end
	

end
