#!/usr/bin/env zx

$.verbose = false;

const location_params = (city) => {
  return new URLSearchParams({
    q: city,
    limit: '1',
    format: 'json',
  }).toString();
};
const location = async (city) => {
  const params = location_params(city);
  const response = await fetch(
    `https://nominatim.openstreetmap.org/search?${params}`
  );
  const [r] = await response.json();
  const l = r.display_name.split(', ');
  return {
    latitude: r.lat,
    longitude: r.lon,
    city: l.shift(),
    country: l.pop(),
  };
};

const weather_params = ({ latitude, longitude }) => {
  return new URLSearchParams({
    latitude,
    longitude,
    current_weather: true,
    timezone: 'auto',
  });
};

const weather = async (city) => {
  const loc = await location(city);
  const params = weather_params(loc);
  const response = await fetch(
    `https://api.open-meteo.com/v1/forecast?${params}`
  );
  const { current_weather } = await response.json();
  return {
    temperature: current_weather.temperature,
    summary: weathercodes[current_weather.weathercode],
    windspeed: current_weather.windspeed,
    location: loc,
  };
};

const YELLOW = '#eed49f';
const SKY = '#91d7e3';
const TEAL = '#8bd5ca';
const BLUE = '#8aadf4';
const MAUVE = '#c6a0f6';

const weathercodes = {
  0: { text: 'Clear sky', icon: '', color: YELLOW },
  1: { text: 'Mainly clear', icon: '', color: YELLOW },
  2: { text: 'Partly Cloudy', icon: '󰖕', color: SKY },
  3: { text: 'Overcast', icon: '󰖐', color: BLUE },
  45: { text: 'Fog', icon: '󰖑', color: MAUVE },
  48: { text: 'Fog', icon: '󰖑', color: MAUVE },
  51: { text: 'Light drizzle', icon: '', color: BLUE },
  53: { text: 'Moderate drizzle', icon: '', color: BLUE },
  55: { text: 'Dense drizzle', icon: '', color: BLUE },
  56: { text: 'Freezing drizzle (light)', icon: '󰙿', color: BLUE },
  57: { text: 'Freezing drizzle (dense)', icon: '󰙿', color: BLUE },
  61: { text: 'Slight rain', icon: '', color: BLUE },
  63: { text: 'Moderate rain', icon: '', color: BLUE },
  65: { text: 'Heavy rain', icon: '󰖖', color: BLUE },
  66: { text: 'Sleet (light)', icon: '', color: TEAL },
  67: { text: 'Sleet (heavy)', icon: '', color: TEAL },
  71: { text: 'Slight snow', icon: '', color: TEAL },
  73: { text: 'Moderate snow', icon: '', color: TEAL },
  75: { text: 'Heavy snow', icon: '󰜗', color: TEAL },
  77: { text: 'Snow', icon: '󰜗', color: TEAL },
  80: { text: 'Slight rain showers', icon: '', color: BLUE },
  81: { text: 'Moderate rain showers', icon: '', color: BLUE },
  82: { text: 'Violent rain showers', icon: '', color: BLUE },
  85: { text: 'Light snow showers', icon: '', color: BLUE },
  86: { text: 'Heavy snow showers', icon: '', color: BLUE },
  95: { text: 'Thunderstorm', icon: '', color: BLUE },
  96: { text: 'Thunderstorm', icon: '', color: BLUE },
  99: { text: 'Thunderstorm', icon: '', color: BLUE },
};

let city = argv.city;
if (!argv.city) {
  city = 'cork';
}

echo(JSON.stringify(await weather(city)));
