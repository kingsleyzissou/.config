import { bind } from 'astal';

import CustomWeather from '@services/weather';

export const Weather = () => {
  const weather = CustomWeather.get_default();
  print('Weather: ', bind(weather, 'weather'));

  return <box></box>;
};
