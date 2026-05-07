import { Gtk } from 'astal/gtk3';
import { GLib, Variable } from 'astal';

const days = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
];

const months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'Octover',
  'November',
  'December',
];

export const Date = () => {
  const time = Variable(GLib.DateTime.new_now_local()).poll(1000, () =>
    GLib.DateTime.new_now_local(),
  );
  return (
    <box
      className="item date"
      onDestroy={() => time.drop()}
      halign={Gtk.Align.CENTER}
      vertical
    >
      <box className="time" halign={Gtk.Align.CENTER}>
        <label>{time((t) => t.format('%H'))}</label>
        <label> | </label>
        <label>{time((t) => t.format('%M'))}</label>
      </box>
      <box className="date" halign={Gtk.Align.CENTER}>
        <label>{time((t) => days[t.get_day_of_week()] + ', ')}</label>
        <label>{time((t) => t.get_day_of_month() + ' ')}</label>
        <label>{time((t) => months[t.get_month() - 1] + ' ')}</label>
      </box>
    </box>
  );
};
