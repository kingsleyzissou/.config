import { App } from 'astal/gtk3';

export const Settings = () => {
  return (
    <button
      className="button settings"
      onClick={() => App.get_window('controlcenter')!.show()}
    >
      <icon className="icon settings" icon="settings-symbolic" />
    </button>
  );
};
