import { App, Gdk } from 'astal/gtk3';

import styles from './styles/style.scss';
import { Widgets } from './src/widgets';
import { requestHandler } from './src/requests/handler';

const onDisplayChange = () => {
  const display = Gdk.Display.get_default();
  display?.connect('monitor-added', (_, monitor) => {
    Widgets.map((window) => App.add_window(window(monitor)));
  });

  display?.connect('monitor-removed', (_, monitor) => {
    App.get_windows().forEach((window) => {
      if (window.gdkmonitor === monitor) {
        App.remove_window(window);
      }
    });
  });
};

App.start({
  css: styles,
  icons: '~/.local/share/icons',
  requestHandler,
  main() {
    Widgets.map((window) => {
      App.get_monitors().map(window);
    });
    onDisplayChange();
  },
});
