# Install the httr package if not already installed
if (!require(httr)) {
  install.packages("httr")
  library(httr)
}

# Load the httr library
library(httr)

# Set the API key
api_key <- "AIzaSyBawtDX3eAHHOIponKva73pyYz6jqzW6rY"

# Example text to translate
text_to_translate <-  "달콤한"

# Target language
target_language <- "Hi"

# Make the API request
response <- GET("https://translation.googleapis.com/language/translate/v2",
                query = list(q = text_to_translate,
                             target = target_language,
                             key = api_key))

# Print the status of the response
print(status_code(response))

# Print the raw response content for inspection
raw_content <- content(response, as = "text", encoding = "UTF-8")
print(raw_content)

# Parse the JSON response
translation <- content(response, "parsed", simplifyVector = FALSE)

# Check the structure of the parsed response
str(translation)

# Extract and print the translated text if available
if (!is.null(translation$data) && !is.null(translation$data$translations)) {
  translated_text <- translation$data$translations[[1]]$translatedText
  print(translated_text)
} else {
  print("Translation failed. Check the response for details.")
}

