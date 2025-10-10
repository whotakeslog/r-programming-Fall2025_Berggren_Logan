data("mtcars")
head(mtcars)
str(mtcars)

print(mtcars)
summary(mtcars)
plot(mtcars)

s3_obj <- list(name = "Myself", age = 29, GPA = 3.5)
class(s3_obj) <- "student_s3"
setClass("student_s4",
         slots = c(name = "character", age = "numeric", GPA = "numeric"))
s4_obj <- new("student_s4", name = "Myself", age = 29, GPA = 3.5)
print(s3_obj)
print(s4_obj)

#You can tell whether an object uses s3 or s4 if it uses the set class function or a list.
#You can determine an objects type by using str to see
#A generic function is one that allows users to do basic tasks related to data
#The principal differences between S3 and S4 is that one needs to be defined as a class and the other is created through setting a class.