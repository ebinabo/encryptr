# vector of alphanumeric characters
characters <- c(
  as.character(0:9) , letters, LETTERS
)

# create empty vector repeating NA 1000 times
samples <- rep(NA,1000)

# replace NA values in samples vector with a sample of
# 3 elements from characters vector collapsed eg "8Le"
for(i in 1:1000) samples[i] <- sample(characters,3) %>% paste(collapse="")

data.frame(
  alnum = characters,
  encrypt = sample(samples, 62),
  stringsAsFactors = F
) -> password_hash_table

usethis::use_data(password_hash_table)
