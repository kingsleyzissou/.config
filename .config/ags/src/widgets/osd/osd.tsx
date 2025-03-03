import { Variable } from 'astal';
import { App, Astal, Gdk } from 'astal/gtk3';

import { OSDBar } from './bar';

import { hideOnEscape } from '@utilities';

export const OSD = (monitor: Gdk.Monitor) => {
  const visible = Variable(false);

  return (
    <window
      gdkmonitor={monitor}
      className="osd"
      namespace="osd"
      application={App}
      layer={Astal.Layer.OVERLAY}
      keymode={Astal.Keymode.ON_DEMAND}
      anchor={Astal.WindowAnchor.RIGHT}
      visible={visible()}
      onKeyPressEvent={hideOnEscape}
    >
      <box>
        <eventbox onClick={() => visible.set(false)}>
          <OSDBar visible={visible} />
        </eventbox>
        <box widthRequest={25} />
      </box>
    </window>
  );
};
