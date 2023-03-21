# require 'chunky_png'

# # Load the blank image and the image to overlay
# blank_image = ChunkyPNG::Image.new(500, 500, ChunkyPNG::Color::TRANSPARENT)
# byebug
# overlay_image = ChunkyPNG::Image.from_file('/home/rails/Desktop/first1.png')

# # Define the position where the overlay image should be placed
# overlay_x = 100
# overlay_y = 100

# # Overlay the image onto the blank image
# blank_image.compose!(overlay_image, overlay_x, overlay_y)

# # Save the final image
# blank_image.save('/home/rails/Desktop/11.png')
# puts blank_image

# require 'chunky_png'

# # Load the two images
# image1 = ChunkyPNG::Image.from_file('/home/rails/Desktop/first11.png')
# image2 = ChunkyPNG::Image.from_file('/home/rails/Desktop/111.png')

# # Define the position where the second image should be placed on top of the first image
# overlay_x = 0
# overlay_y = 0

# # Overlay the second image onto the first image
# image1.compose!(image2, overlay_x, overlay_y)

# # Save the final image
# image1.save('/home/rails/Desktop/output.png')

require 'chunky_png'

# Load the two images
image1 = ChunkyPNG::Image.from_file('/home/rails/Desktop/circle1.png')
image2 = ChunkyPNG::Image.from_file('/home/rails/Desktop/tiger1.png')
# Calculate the size of the circle in the first image
circle_center_x = image1.width / 2
circle_center_y = image1.height / 2
circle_radius = [circle_center_x, circle_center_y].min

# Resize the second image to match the size of the circle in the first image
circle_diameter = circle_radius * 2
image2.resample_bilinear!(circle_diameter, circle_diameter)

# Fill the circle in the first image with the second image
for y in (circle_center_y - circle_radius)...(circle_center_y + circle_radius)
  for x in (circle_center_x - circle_radius)...(circle_center_x + circle_radius)
    if (x - circle_center_x)**2 + (y - circle_center_y)**2 <= circle_radius**2
      x2 = x - circle_center_x + circle_radius
      y2 = y - circle_center_y + circle_radius
      if x2 >= 0 && x2 < image2.width && y2 >= 0 && y2 < image2.height
        image1[x, y] = image2[x2, y2]
      end
    end
  end
end
# Save the final image
image1.save('/home/rails/Desktop/final_1.png')
