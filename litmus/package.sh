#! /usr/bin/env ruby 


files_to_package = ["Gemfile","Gemfile.lock","run.sh", "spec/" ]
package_file_name = "build/litmus.package"


print "Litmus packaging password: "
pw_stdin = gets.chomp

if pw_stdin.nil? || pw_stdin == ''
 puts "Packaging password is required"
 exit
end


cmd = "zip -r -P '#{pw_stdin}' #{package_file_name} #{files_to_package.join(" ")}"
system(cmd)
