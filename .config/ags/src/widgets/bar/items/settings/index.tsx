import { App } from 'astal/gtk3';

// #2C2C2E
// #CDCBCC
export const Settings = () => {
  return (
    <button
      className="button"
      onClick={() => App.get_window('controlcenter')!.show()}
    >
      <icon
        className="icon settings"
        icon="org.gnome.Settings-system-symbolic"
      />
    </button>
  );
};
