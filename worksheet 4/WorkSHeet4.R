library(imager) #now without quotes
dog <- load.image("dog.jpeg")
dim(dog) # stored as RGB #645-columns , 635-rows , 1-depth , 1-Red ,Green, Blue
plot(dog) # plot image

#To Obtain Gray Colored Version of this image
graydog <- grayscale(dog)
plot(graydog)
dim(graydog) #645-columns , 635-rows , 1-depth , 1-black,white

# Extract the black and white image as matrix
gray.mat <- as.matrix(graydog[,,1,1]) #2-D Array
dim(gray.mat)

# Extracts the array will all three rgb channels
col.mat <- as.array(dog[, ,1, ]) #3-D Array
dim(col.mat)

# Vertical cropping
cropped.mat <- col.mat[1:300, , ]
crop.dog <- as.cimg(cropped.mat)
plot(crop.dog)


# Horizontal cropping
cropped.mat <- col.mat[, 1:300, 3]
crop.dog <- as.cimg(cropped.mat)
plot(crop.dog)

plot(dog)

#Dog With Only Blue Color
blue.mat <- col.mat[,, 3]
blue.dog <- as.cimg(blue.mat)
plot(blue.dog)

#Dog With Only Green Color
green.mat <- col.mat[,, 2]
green.dog <- as.cimg(green.mat)
plot(green.dog)

