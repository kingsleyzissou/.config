import { Variable } from 'astal';
import { App, Astal, Gdk } from 'astal/gtk3';

import Apps from 'gi://AstalApps';

import { Entry } from './entry';

import { hideOnEscape } from '@utilities';

const LIMIT = 8;

const hide = () => {
  App.get_window('launcher')!.hide();
};

export const Launcher = (gdkmonitor: Gdk.Monitor) => {
  const apps = new Apps.Apps();

  const width = Variable(500);
  const text = Variable('');
  const list = text((text) => {
    if (text === '') {
      return [];
    }
    return apps.fuzzy_query(text).slice(0, LIMIT);
  });

  const onEnter = () => {
    apps.fuzzy_query(text.get())?.[0].launch();
    hide();
  };

  return (
    <window
      name="launcher"
      anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.BOTTOM}
      exclusivity={Astal.Exclusivity.IGNORE}
      keymode={Astal.Keymode.ON_DEMAND}
      application={App}
      gdkmonitor={gdkmonitor}
      visible={false}
      onShow={() => {
        text.set('');
        width.set(100);
      }}
      onKeyPressEvent={hideOnEscape}
    >
      <box>
        <eventbox
          widthRequest={width((w) => w / 2)}
          expand
          onClick={() => hide()}
        />
        <box hexpand={false} vertical>
          <eventbox heightRequest={200} onClick={() => hide()} />
          <box className="search" widthRequest={800} vertical>
            <entry
              primaryIconName="folder-saved-search-symbolic"
              placeholderText="Search..."
              text={text()}
              onChanged={(value) => text.set(value.text)}
              onActivate={onEnter}
            />
          </box>
          <box
            className="container"
            widthRequest={500}
            vertical
            visible={list.as((l) => l.length > 0)}
          >
            <box spacing={6} className="entries" vertical>
              {list.as((list) => list.map((app) => <Entry app={app} />))}
            </box>
          </box>
        </box>
      </box>
    </window>
  );
};
