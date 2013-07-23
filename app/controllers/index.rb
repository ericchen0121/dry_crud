get '/' do
  erb :index
end

get '/create' do
  erb :create_note
end

post '/create/note' do
	current_note = Note.create(params[:new_note_data])
	redirect "/show/note/#{current_note.id}"
end

get '/show/note/:note_id' do
	@all_notes = [Note.data(params[:note_id])]
	erb :show_notes
end

get '/show/notes/all' do
	@all_notes = Note.all_data
	erb :show_notes
end

get '/edit/note/:note_id' do
	@current_note = Note.data(params[:note_id])
	erb :edit_note
end

put '/edit/note/:note_id' do
	edit_note = Note.find(params[:note_id])
	edit_note.update_attributes(params[:edit_note_data])

	redirect "/show/note/#{edit_note.id}"
end

delete '/delete/note/:note_id' do
	Note.delete(params[:note_id])
	redirect '/show/notes/all'
end

