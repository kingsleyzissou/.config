import { timeout, Variable } from 'astal';
import { Gtk } from 'astal/gtk3';

import WirePlumber from 'gi://AstalWp';
import Brightness from '@services/brightness';

export const OSDBar = ({ visible }: { visible: Variable<boolean> }) => {
  const brightness = Brightness.get_default();
  const speaker = WirePlumber.get_default()!.get_default_speaker();

  const count = Variable(0);
  const value = Variable(0);
  const iconName = Variable('');

  const show = (v: number, icon: string) => {
    visible.set(true);
    value.set(v);
    iconName.set(icon);
    count.set(count.get() + 1);
    timeout(2000, () => {
      count.set(count.get() - 1);
      if (count.get() === 0) visible.set(false);
    });
  };

  return (
    <revealer
      setup={(self) => {
        if (speaker) {
          self.hook(brightness, 'notify::screen', () =>
            show(brightness.screen, 'display-brightness-symbolic'),
          );

          self.hook(speaker, 'notify::volume', () =>
            show(speaker.volume, speaker.volumeIcon),
          );
        }
      }}
      revealChild={visible()}
      transitionType={Gtk.RevealerTransitionType.SLIDE_UP}
    >
      <box className="osd" valign={Gtk.Align.CENTER} vertical>
        <levelbar
          valign={Gtk.Align.CENTER}
          heightRequest={100}
          value={value()}
          vertical
          inverted
        />
        <icon icon={iconName()} />
        {false && <label label={value((v) => `${Math.floor(v * 100)}%`)} />}
      </box>
    </revealer>
  );
};
