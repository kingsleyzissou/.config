import { GLib, Variable } from 'astal';

export const Time = () => {
  const time = Variable(GLib.DateTime.new_now_local()).poll(1000, () =>
    GLib.DateTime.new_now_local(),
  );

  return (
    <box className="box" onDestroy={() => time.drop()}>
      <box className="time">
        <label className="hours">{time((t) => t.format('%H'))}</label>
        <label className="separator">:</label>
        <label className="minutes">{time((t) => t.format('%M'))}</label>
      </box>
    </box>
  );
};
