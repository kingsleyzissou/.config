import { App } from 'astal/gtk3';

import styles from './styles/style.scss';
import { Widgets } from './src/widgets';
import { requestHandler } from './src/requests/handler';

App.start({
  css: styles,
  icons: '~/.local/share/icons',
  requestHandler,
  main() {
    Widgets.map((window) => App.get_monitors().map(window));
  },
});
