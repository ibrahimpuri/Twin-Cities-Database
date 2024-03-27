<?php
// Read config file
$config_file = 'config.json';
$config_data = file_get_contents($config_file);
$config = json_decode($config_data, true);

// Extract database connection details
$db_host = $config['database']['host'];
$db_username = $config['database']['username'];
$db_password = $config['database']['password'];
$db_name = $config['database']['database'];
$weatherApi = $config['apiKeys']['openWeather'];

// Create a new RSS feed
$feed = '<?xml version="1.0" encoding="UTF-8"?>';
$feed .= '<rss version="2.0">';
$feed .= '<channel>';
$feed .= '<title>My City RSS Feed</title>';
$feed .= '<link>http://' . $_SERVER["HTTP_HOST"] . '/rss_feed.xml</link>';
$feed .= '<description>RSS feed for cities and places of interest</description>';

// Connect to MySQL database
$conn = new mysqli($db_host, $db_username, $db_password, $db_name);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query for cities
$sql_cities = "SELECT * FROM TownCity";
$result_cities = $conn->query($sql_cities);

if ($result_cities->num_rows > 0) {
    while ($city_row = $result_cities->fetch_assoc()) {
        $city_id = $city_row["CityID"];
        $city_name = $city_row["Name"];
        $country = $city_row["Country"];
        $population = $city_row["Population"];
        // Add city node
        $feed .= '<item>';
        $feed .= '<title>' . $city_name . '</title>';
        $feed .= '<description>Population: ' . $population . ', Country: ' . $country . '</description>';

        $url = "http://api.openweathermap.org/data/2.5/weather?q=" . urlencode($city_name) . "&appid=" . $weatherApi . "&units=metric";

        // Fetch weather data
        $weather_data = file_get_contents($url);

        if ($weather_data) {
            // Decode JSON response
            $weather_info = json_decode($weather_data, true);

            // Check if API request was successful
            if ($weather_info && isset($weather_info['main'], $weather_info['weather'], $weather_info['wind'])) {
                // Extract relevant weather information
                $temperature = $weather_info['main']['temp'];
                $weather_description = $weather_info['weather'][0]['description'];
                $humidity = $weather_info['main']['humidity'];
                $wind_speed = $weather_info['wind']['speed'];
                // Add weather node
                $feed .= '<weather>';
                $feed .= '<temperature>' . $temperature . '</temperature>';
                $feed .= '<description>' . $weather_description . '</description>';
                $feed .= '<humidity>' . $humidity . '</humidity>';
                $feed .= '<wind_speed>' . $wind_speed . '</wind_speed>';
                $feed .= '</weather>';
            }
        }
        // Query for places of interest for the city
        $sql_places = "SELECT * FROM PlaceOfInterest WHERE CityID = $city_id";
        $result_places = $conn->query($sql_places);
        if ($result_places->num_rows > 0) {
            // Add places of interest node
            $feed .= '<places_of_interest>';
            while ($place_row = $result_places->fetch_assoc()) {
                $place_name = $place_row["Name"];
                $place_type = $place_row["Type"];
                $Capacity = $place_row["Capacity"];
                $Latitude = $place_row["Latitude"];
                $Longitude = $place_row["Longitude"];
                $Photo = $place_row["Photo"];
                $Description = $place_row["Description"];
                $OpeningHours = $place_row["OpeningHours"];
                $Rating = $place_row["Rating"];
                // Add place of interest node
                $feed .= '<place>';
                $feed .= '<name>' . $place_name . '</name>';
                $feed .= '<type>' . $place_type . '</type>';
                $feed .= '<capacity>' . $Capacity . '</capacity>';
                $feed .= '<latitude>' . $Latitude . '</latitude>';
                $feed .= '<longitude>' . $Longitude . '</longitude>';
                $feed .= '<description>' . $Description . '</description>';
                $feed .= '<openinghours>' . $OpeningHours . '</openinghours>';
                $feed .= '<rating>' . $Rating . '</rating>';
                $feed .= '<link>' . $Photo . '</link>';
                $feed .= '</place>';
            }
            $feed .= '</places_of_interest>';
        }
        $sql_events = "SELECT * FROM Events WHERE CityID = $city_id";
        $result_events = $conn->query($sql_events);
        if ($result_events->num_rows > 0) {
            // Add event node
            $feed .= '<events>';
            while ($place_row = $result_events->fetch_assoc()) {
                $event_name = $place_row["Name"];
                $Description = $place_row["Description"];
                $Date = $place_row["Date"];

                $feed .= '<event>';
                $feed .= '<name>' . $event_name . '</name>';
                $feed .= '<description>' . $Description . '</description>';
                $feed .= '<date>' . $Date . '</date>';
                $feed .= '</event>';
            }
            $feed .= '</events>';
        }

        // Close events node
        $feed .= '</item>';
    }
}

// Close RSS feed
$feed .= '</channel>';
$feed .= '</rss>';

// Save feed to file
$file_path = 'rss_feed.xml';
file_put_contents($file_path, $feed);

$city_id = '';
?>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lo-Ly Twins</title>
        <link rel="stylesheet" href="./assets/css/style.css">
    </head>

    <body>
        <?php include('header.php'); ?>
        <main>
            <div class="container text-center">
                <a href="rss_feed.xml" target="_blank" class="btn active">RSS FEED</a>
            </div>
        </main>
    </body>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</html>