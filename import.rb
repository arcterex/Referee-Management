#!/usr/bin/env ruby -wKU
require 'fastercsv'
data = FasterCSV.read("/Users/alan/Desktop/schedule3.csv")

# get all the current agegroups
allages = Array.new
alllevels = Array.new
Age.all.each { |x| allages << x.name }
Level.all.each { |x| alllevels << x.name }

# first get the list of age groups
data.each do |row|
	ag = row[1]
	ag =~ /(^.*?) (.*$)/
	agegroup = $1
	level = $2

	if agegroup.nil? && level.nil? then
		agegroup = ag
	end

	# do we need to add this agegroup?
	unless allages.include?(agegroup) then
		puts "Adding #{agegroup}"
		a = Age.new( :name => agegroup, :description => "Age Group #{agegroup}" )
		a.save
	end

	unless level.nil? or level.empty?
		# trim whitespace
		level.chomp!
		level.gsub!(/ +$/,'')

		if alllevels.include?(level.capitalize) then
		else 
			level.capitalize!
			l = Level.new( :name => level, :description => "#{level} Level" )
			l.save
			puts "Added '#{level}'" 
		end
	end

	p row

	# create the fields required
	field.chomp!
	field.gsub!(/ +$/,'')
	if Field.find_by_name(field) then
		puts "Field #{field} already there"
	else 
#		f = Field.new(:name => field, :link
		puts "Adding #{field}"
	end
end
