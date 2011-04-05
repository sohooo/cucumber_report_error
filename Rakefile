desc "execution with normal system call"
task :normal do
  cukeit "normal"
end

desc "execution with forked system call"
task :forked do
  cukeit "forked"
end

def cukeit(type)
  puts "running #{type} cukes"
  system("cucumber --tags @#{type} --format html --out #{type}.html")

  print "# of body tags in #{type}.html: "
  system("grep -c '<body>' #{type}.html")
end
