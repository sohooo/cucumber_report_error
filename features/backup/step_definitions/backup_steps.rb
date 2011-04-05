require File.expand_path("../../../../backup", __FILE__)


Angenommen /ich habe eine Datenbank '(\w+)'/ do |dbname|
  @dbname = dbname
end

Und /ich starte das normale Backup/ do
  @mybackup = Backup.new @dbname
  @result = @mybackup.perform_normal!
end

Und /ich starte das forked Backup/ do
  @mybackup = Backup.new @dbname
  @result = @mybackup.perform_forked!
end

Dann /sollte die Meldung '(.*)' lauten/ do |msg|
  assert_equal msg, @result
end
