import json
import requests
from bs4 import BeautifulSoup

def get_fish_names_by_letter(letter):
    # Make a request to the Wikipedia page
    url = "https://en.wikipedia.org/wiki/List_of_fish_common_names"
    response = requests.get(url)
    
    # Create a BeautifulSoup object
    soup = BeautifulSoup(response.text, "html.parser")
    
    # Find the div containing fish names
    divs = soup.find_all("div", class_="div-col", style="column-width: 18em;")
    if not divs:
        return []  # Return an empty list if no div is found
    
    # Retrieve fish names starting with the specified letter
    fish_names = []
    for div in divs:
        links = div.find_all("a")
        for link in links:
            name = link.text.strip()
            if name.startswith(letter):
                fish_names.append(name)
    
    return fish_names

# Retrieve fish names for each letter of the alphabet
alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
all_fish_names = {}
for letter in alphabet:
    fish_names = get_fish_names_by_letter(letter)
    all_fish_names[letter] = fish_names

# Save fish names data to a JSON file
with open("FishName.json", "w") as file:
    json.dump(all_fish_names, file)

print("Fish names data saved to FishName.json.")
