import { bind } from 'astal';

import ScreenCapture from '@services/screencapture';

export const Recording = () => {
  const screencapture = ScreenCapture.get_default();

  return (
    <>
      {bind(screencapture, 'recording').as((v) => {
        if (!v) {
          return <></>;
        }

        return (
          <button
            className="button"
            onClick={() => {
              screencapture.stop();
            }}
          >
            <box>
              <icon className="icon recording" icon="media-record-symbolic" />
            </box>
          </button>
        );
      })}
    </>
  );
};
