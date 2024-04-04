weather_output=$(curl -s "https://forecast.weather.gov/product.php?site=NWS&issuedby=BGM&product=AFD&format=ci&version=1&glossary=1&highlight=off" | pup 'pre text{}' | awk '/Area Forecast/,/NEAR TERM/'| sed '/Area Forecast Discussion/d;/SYNOPSIS/d;/&amp/d;/NEAR TERM/d'| tr '\n' ' ')
sed "s|@weather_content@|$weather_output|" template.html > index.html
