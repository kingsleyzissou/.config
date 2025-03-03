import { App } from 'astal/gtk3';

import Apps from 'gi://AstalApps';

import ScreencaptureService from '@services/screencapture';

const hide = () => {
  App.get_window('controlcenter')!.hide();
};

export const Tools = () => {
  const apps = new Apps.Apps();
  const screencapture = ScreencaptureService.get_default();

  return (
    <box className="tools" vertical>
      <button
        className="tool"
        onClick={() => {
          hide();
          App.get_window('screencapture')!.show();
        }}
      >
        <icon icon="camera-photo-symbolic" />
      </button>
      <button
        className="tool"
        onClick={() => {
          hide();
          screencapture.pickColor();
        }}
      >
        <icon icon="color-select-symbolic" />
      </button>
      <button
        className="tool"
        onClick={() => {
          hide();
          apps.fuzzy_query('ghostty')[0].launch();
        }}
      >
        <icon icon="utilities-terminal-symbolic" />
      </button>
    </box>
  );
};
