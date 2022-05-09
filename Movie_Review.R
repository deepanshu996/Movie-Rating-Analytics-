
#Read CSV
Movie_Ratings = read.csv("/Users/deepanshu/Documents/My Learnings/R programming/Movie Ratings.csv", stringsAsFactors=TRUE)


#Explore Data
head(Movie_Ratings)
str(Movie_Ratings)
#Change Column Name
colnames(Movie_Ratings) = c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Year")
head(Movie_Ratings)
nrow(Movie_Ratings)
tail(Movie_Ratings)
str(Movie_Ratings)
summary(Movie_Ratings)

#Covert Column to Factor
Movie_Ratings$Year = factor(Movie_Ratings$Year)

#ggplot install

install.packages("ggplot2")
library(ggplot2)

#add aesthetics/gemometry points

p = ggplot(data = Movie_Ratings, aes(x= CriticRating, y= AudienceRating, color = Genre, size = BudgetMillions)) + 
    geom_point()

#Change X-axis to budget (Avidiance Vs Budget Graph)

p + geom_point(aes(x=BudgetMillions)) + xlab("Budget in Millions")

head(Movie_Ratings)


#Histogram

h = ggplot(data=Movie_Ratings, aes(x=BudgetMillions)) 
  

#Bin width
h + geom_histogram(binwidth = 10, aes(fill=Genre), color = "Black")

#Default

t = ggplot(data=Movie_Ratings)
t

# Audiance Review

t + geom_histogram(aes(x=AudienceRating, fill = Genre), binwidth = 10, color = "Black") +
  ylab('Number of movies') + 
  xlab('Audiance Rating')
  
# Critics Review

t + geom_histogram(aes(x=CriticRating, fill = Genre), binwidth = 10, color = "Black") +
  ylab('Number of movies') +
  xlab('Critics Rating')

#Statistics

s = ggplot(data = Movie_Ratings, aes(x = CriticRating, y = AudienceRating, color = Genre))
s + geom_point() + geom_smooth(fill = NA)

#Box Plot

b = ggplot(data = Movie_Ratings, aes(x= Genre, y = AudienceRating, color = Genre))

b + geom_boxplot() + geom_point()

#Hack to scatter the points

b + geom_boxplot() + geom_jitter()

b + geom_jitter() + geom_boxplot(alpha= 0.7)

#Facets

f = ggplot(data = Movie_Ratings, aes(x=BudgetMillions))
f + geom_histogram(binwidth = 10, aes(fill=Genre), color = "Black") + 
    facet_grid(Genre~., scales = "free") 
    

#Scatter Plot

s = ggplot(data = Movie_Ratings, aes(x=CriticRating, y = AudienceRating, color = Genre))

s + geom_point(aes(size = BudgetMillions)) + facet_grid(Genre~Year) + geom_smooth()
    
#Co-ordinates

s + geom_point(aes(size = BudgetMillions)) + 
  facet_grid(Genre~Year) + 
  geom_smooth()+
  coord_cartesian(ylim = c(0,100)) 

#Themes

t = ggplot(data=Movie_Ratings, aes(x=BudgetMillions)) 
h = t + geom_histogram(binwidth = 10, aes(fill=Genre), color = "Black")

h + xlab("Budget in Millions") + 
  ylab('Number of movies') +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(color = 'Dark Green', size=20),
        axis.title.y = element_text(color = 'Red', size =20),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10),
        
        legend.title = element_text(size= 30),
        legend.text = element_text(size= 20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(color = "Dark Blue", 
                                  size = 25,
                                  family = 'Courier'))




  
       