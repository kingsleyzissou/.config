import { App } from 'astal/gtk3';
import { monitorFile } from 'astal/file';

import styles from './styles/style.scss';
import { Widgets } from './src/widgets';
import { requestHandler } from './src/requests/handler';

monitorFile('./styles', (styles) => {
  App.reset_css();
  App.apply_css(styles);
});

App.start({
  css: styles,
  icons: '/usr/share/custom-icons',
  requestHandler,
  main() {
    Widgets.map((window) => App.get_monitors().map(window));
  },
});
