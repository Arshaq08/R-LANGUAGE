install.packages("caret") 

sms_raw <- read.csv(file.choose(),sep=",",header=T,stringsAsFactors = FALSE) 
str(sms_raw) 
sms_raw$type <- factor(sms_raw$type) 
str(sms_raw$type) 
table(sms_raw$type) 
#install.packages("tm") 
library(tm) 
# First step for text mining is to create corpus,  
#which is the collection of text documents 
# types of corpus - Vcorpus, Pcorpus 
#VectorCorpus reader function which used to create source object  
#from existing vector 
sms_corpus <- VCorpus(VectorSource(sms_raw$text)) 
print(sms_corpus) 
inspect(sms_corpus[1:2]) 
as.character(sms_corpus[[1]]) 
lapply(sms_corpus[1:2], as.character) 
sms_corpus <- tm_map(sms_corpus, 
                     content_transformer(tolower)) 
lapply(sms_corpus,as.character) 
as.character(sms_corpus[[1]]) 
as.character(sms_corpus_clean[[1]]) 
sms_corpus 
sms_corpus <- tm_map(sms_corpus, removeNumbers) 
lapply(sms_corpus,as.character) 
stopwords('en') 
sms_corpus <- tm_map(sms_corpus, 
                     removeWords, stopwords()) 
lapply(sms_corpus,as.character) 
sms_corpus <- tm_map(sms_corpus, removePunctuation) 
lapply(sms_corpus,as.character) 
#install.packages("SnowballC") 
library(SnowballC) 
wordStem(c("learn", "learned", "learning", "learns")) 
sms_corpus <- tm_map(sms_corpus, stemDocument) 
lapply(sms_corpus,as.character) 
sms_corpus <- tm_map(sms_corpus, stripWhitespace) 
lapply(sms_corpus,as.character) 

sms_dtm <- DocumentTermMatrix(sms_corpus) 

#######word cloud chart###### 
#install.packages("wordcloud") 
library("wordcloud") 
wordcloud(sms_corpus,min.freq = 150,random.order = F) 
#install.packages("RColorBrewer") 
library("RColorBrewer")                 
wordcloud(sms_corpus,min.freq = 150,random.order = F, 
          color=brewer.pal(8,"Dark2"),rot.per = 0.20) 

sms_dtm_train <- sms_dtm[1:4169, ] 
sms_dtm_test <- sms_dtm[4170:5559, ] 
sms_train_labels <- sms_raw[1:4169, ]$type 
sms_test_labels <- sms_raw[4170:5559, ]$type 
#install.packages("wordcloud") 
library(wordcloud) 
wordcloud(sms_corpus, min.freq = 50, random.order = FALSE) 
findFreqTerms(sms_dtm_train, 5) 
sms_freq_words <- findFreqTerms(sms_dtm_train, 5) 
str(sms_freq_words) 
sms_dtm_freq_train<- sms_dtm_train[ , sms_freq_words] 
sms_dtm_freq_test <- sms_dtm_test[ , sms_freq_words] 

convert_counts <- function(x) { 
  x <- ifelse(x > 0, "Yes", "No") 
} 
sms_train <- apply(sms_dtm_freq_train, MARGIN = 2, 
                   convert_counts) 
sms_test <- apply(sms_dtm_freq_test, MARGIN = 2, 
                  convert_counts) 
#install.packages("e1071") 
library(e1071) 
sms_classifier <- naiveBayes(sms_train, sms_train_labels) 
sms_test_pred <- predict(sms_classifier, sms_test) 
library(gmodels) 
CrossTable(sms_test_pred, sms_test_labels, 
           dnn = c('predicted', 'actual')) 

#or 
confusion_matrix <- confusionMatrix(sms_test_pred,  
                                    sms_test_labels) 
confusion_matrix





#################################SAME CODE###############################################
# Install necessary packages
install.packages("caret")
install.packages("tm")
install.packages("SnowballC")
install.packages("wordcloud")
install.packages("RColorBrewer")
install.packages("e1071")
install.packages("gmodels")

# Load required libraries
library(caret)
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)
library(e1071)
library(gmodels)

# Load the SMS dataset
sms_raw <- read.csv(file.choose(), sep = ",", header = TRUE, stringsAsFactors = FALSE)

# Check the structure of the dataset
str(sms_raw)

# Convert 'type' column to a factor (for spam/ham classification)
sms_raw$type <- factor(sms_raw$type)
str(sms_raw$type)

# Check the distribution of spam and ham messages
table(sms_raw$type)

# Create a text corpus from the 'text' column
sms_corpus <- VCorpus(VectorSource(sms_raw$text))

# Inspect the first two messages in the corpus
inspect(sms_corpus[1:2])

# Convert all text to lowercase
sms_corpus <- tm_map(sms_corpus, content_transformer(tolower))

# Remove numbers from the text
sms_corpus <- tm_map(sms_corpus, removeNumbers)

# Remove common stopwords like 'the', 'is', etc.
sms_corpus <- tm_map(sms_corpus, removeWords, stopwords('en'))

# Remove punctuation from the text
sms_corpus <- tm_map(sms_corpus, removePunctuation)

# Apply stemming (reducing words to their base form, e.g., "learned" -> "learn")
sms_corpus <- tm_map(sms_corpus, stemDocument)

# Remove extra whitespace
sms_corpus <- tm_map(sms_corpus, stripWhitespace)

# Create a Document-Term Matrix (DTM) from the cleaned corpus
sms_dtm <- DocumentTermMatrix(sms_corpus)

####### Word Cloud Generation #######

# Create a word cloud of terms with a minimum frequency of 150
wordcloud(sms_corpus, min.freq = 150, random.order = FALSE)

# Create a word cloud with custom color and rotation
wordcloud(sms_corpus, min.freq = 150, random.order = FALSE,
          colors = brewer.pal(8, "Dark2"), rot.per = 0.20)

####### Data Preparation for Naive Bayes Classifier #######

# Split the DTM into training (first 4169) and testing (from 4170 to 5559) sets
sms_dtm_train <- sms_dtm[1:4169, ]
sms_dtm_test <- sms_dtm[4170:5559, ]

# Extract labels (spam/ham) for training and testing sets
sms_train_labels <- sms_raw$type[1:4169]
sms_test_labels <- sms_raw$type[4170:5559]

# Create another word cloud with minimum frequency of 50
wordcloud(sms_corpus, min.freq = 50, random.order = FALSE)

# Find terms that occur at least 5 times in the training set
sms_freq_words <- findFreqTerms(sms_dtm_train, 5)

# Filter the training and testing DTM to include only frequent words
sms_dtm_freq_train <- sms_dtm_train[, sms_freq_words]
sms_dtm_freq_test <- sms_dtm_test[, sms_freq_words]

# Function to convert counts into binary values ("Yes" for presence, "No" for absence)
convert_counts <- function(x) {
  x <- ifelse(x > 0, "Yes", "No")
}

# Apply the conversion function to the training and testing datasets
sms_train <- apply(sms_dtm_freq_train, MARGIN = 2, convert_counts)
sms_test <- apply(sms_dtm_freq_test, MARGIN = 2, convert_counts)

####### Naive Bayes Classifier #######

# Train a Naive Bayes classifier on the training data
sms_classifier <- naiveBayes(sms_train, sms_train_labels)

# Use the trained classifier to predict on the testing data
sms_test_pred <- predict(sms_classifier, sms_test)

####### Evaluation #######

# Generate a cross table to compare predicted and actual values
CrossTable(sms_test_pred, sms_test_labels, dnn = c('Predicted', 'Actual'))

# Install the 'caret' package if not already installed
install.packages("caret")

# Load the 'caret' library
library(caret)

# Or use confusion matrix to evaluate model performance using 'caret' package
confusion_matrix <- confusionMatrix(sms_test_pred, sms_test_labels)
confusion_matrix  # View the confusion matrix for evaluation
