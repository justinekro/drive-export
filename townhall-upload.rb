require 'google_drive'
require_relative 'townhall-scrap'

$data = get_hash

# On crée une méthode qui appelle drive et configure la spreadsheet

def setup_spreadsheet
  session = GoogleDrive::Session.from_config("config.json")
  $ws = session.spreadsheet_by_key("1WZlxVwV-16lO9X94zwm01d7l_HQ9-jJ9jB7QsmMFbFs").worksheets[0]
  $ws[1, 1] = "Mairie"
  $ws[1, 2] = "Adresse mail"
  $ws.save
end

# On crée une méthode qui récupère le hash et l'imprime sur un googledrive
def upload_hash
	setup_spreadsheet
	i = 2
	$data.keys.each do |key|
	$ws[i,1] = key
	$ws[i,2] = $data[$ws[i,1]]  
	i += 1 
	end
  $ws.save	
end
 
# On appelle la dernière méthode
upload_hash