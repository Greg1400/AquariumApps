import requests
from bs4 import BeautifulSoup

def scrape_all_fish_names():
    url = 'https://en.wikipedia.org/wiki/List_of_fish_common_names'

    response = requests.get(url)
    if response.status_code == 200:
        soup = BeautifulSoup(response.content, 'html.parser')

        # Find the table containing the fish names
        table = soup.find('table', class_='wikitable')

        # Process and store the fish names
        fish_names = []
        rows = table.find_all('tr')
        for row in rows[1:]:  # Exclude the header row
            columns = row.find_all('td')
            if columns:
                fish_link = columns[0].find('a')
                fish_name = fish_link.text.strip() if fish_link else ''
                fish_names.append(fish_name)

        return fish_names

    else:
        print('Error retrieving data:', response.status_code)

# Call the function to scrape all fish names
all_fish_names = scrape_all_fish_names()

if all_fish_names is not None:
    # Print all fish names
    for fish_name in all_fish_names:
        print(fish_name)
