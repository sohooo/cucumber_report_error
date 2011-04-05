# language: de

# Tags:
@backup @normal

Funktionalität: Datenbank Backup
  Zur Vermeidung von Datenverlust
  möchte ich ein Backup der Datenbank erstellen

  Szenario: Basic Backup
  Angenommen ich habe eine Datenbank 'sinatra'
  Und ich starte das normale Backup
  Dann sollte die Meldung 'starting backup of sinatra' lauten
