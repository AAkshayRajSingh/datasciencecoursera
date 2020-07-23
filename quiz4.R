
library(jsonlite)
library(httpuv)
library(httr)
oauth_endpoints("github")
myapp <- oauth_app("Akshayrajsingh",
                   key = "96df595286b29760f6f7",
                   secret = "582f3f02170615cf85269ac65f953cded9c6b35e"
)
github_token <- oauth2.0_token(oauth_endpoints("Akshayrajsingh"), myapp)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)
