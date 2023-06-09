#!/usr/bin/ruby

=begin
A simple script for resizing images in bulk. Does a scaled resize.

Maximum size is defined below with MAX_WIDTH and MAX_HEIGHT.

Only processes .jpg files.

Does not try to resize images below the defined `MAX_` dimensions.

(I may have gone a bit overboard here, forgive me -IK)

Requisites:
- imagemagick
- ruby 

To use:
- copy to public/images/uploads
- run `./resize.rb`

=end

module Resizer
  extend self

  MAX_WIDTH = 1000
  MAX_HEIGHT = 1000

  def run
    image_files = Dir.glob('*.jpg')
    processed = 0
    skipped = 0

    identify_exe = `which identify`.strip
    if $? != 0
      puts "error: could not find `identify`. do you have imagemagick installed?"
      exit -1
    end
    puts "using #{identify_exe}"

    convert_exe = `which convert`.strip
    if $? != 0
      puts "error: could not find `convert`. do you have imagemagick installed?"
      exit -1
    end
    puts "using #{convert_exe}"

    image_files.each do |filename|
      puts filename

      command = "#{identify_exe} -format \"%w %h\" #{filename}"
      output = `#{command}`
      if $? != 0
        skipped += 1
        puts "  could not read image size"
        next
      end

      width, height = output.split.map(&:to_i)
      puts "  width=#{width}  height=#{height}"
      next if width <= MAX_WIDTH && height <= MAX_HEIGHT

      command = "#{convert_exe} #{filename} -resize #{MAX_WIDTH}x#{MAX_HEIGHT} #{filename}"      
      output = `#{command}`
      if $? == 0
        processed += 1
        puts "  converted"
      else
        skipped += 1
        puts "  failed"
      end
    end

    puts "\nDone."
    puts "found #{image_files.length} images, processed #{processed} and skipped #{skipped}"
  end
end

Resizer.run

